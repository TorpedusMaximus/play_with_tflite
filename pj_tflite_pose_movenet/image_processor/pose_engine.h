#ifndef POSE_ENGINE_
#define POSE_ENGINE_

#include <cstdint>
#include <cmath>
#include <string>
#include <vector>
#include <array>
#include <memory>
#include <opencv2/opencv.hpp>
#include "inference_helper.h"
#include "bounding_box.h"

class PoseEngine {
public:
    enum {
        kRetOk = 0,
        kRetErr = -1,
    };

    typedef std::array<std::pair<int32_t, int32_t>, 17> KeyPoint;
    typedef std::array<float, 17> KeyPointScore;

    typedef struct Result_ {
        std::vector<KeyPoint>    keypoint_list;
        std::vector<KeyPointScore> keypoint_score_list;
        struct crop_ {
            int32_t x;
            int32_t y;
            int32_t w;
            int32_t h;
            crop_() : x(0), y(0), w(0), h(0) {}
        } crop;
        double    time_inference;		// [msec]
        Result_() : time_inference(0)
        {}
    } Result;

public:
    PoseEngine() = default;
    ~PoseEngine() = default;
    int32_t Initialize(const std::string& work_dir, const int32_t num_threads);
    int32_t Finalize(void);
    int32_t Process(const cv::Mat& original_mat, Result& result);

private:
    std::unique_ptr<InferenceHelper> inference_helper_;
    std::vector<InputTensorInfo> input_tensor_info_list_;
    std::vector<OutputTensorInfo> output_tensor_info_list_;
};

#endif
