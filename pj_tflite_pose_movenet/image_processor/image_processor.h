#ifndef IMAGE_PROCESSOR_H_
#define IMAGE_PROCESSOR_H_

#include <cstdint>
#include <cmath>
#include <string>
#include <vector>
#include <array>
#include "pose_engine.h"

namespace cv {
    class Mat;
};

namespace ImageProcessor
{

typedef struct {
    char     work_dir[256];
    int32_t  num_threads;
} InputParam;

typedef struct {
    double time_pre_process;   // [msec]
    double time_inference;    // [msec]
    double time_post_process;  // [msec]
} Result;

int32_t Initialize(const InputParam& input_param);
int32_t Process(cv::Mat& mat, Result& result);
int32_t Finalize(void);
int32_t Command(int32_t cmd);
int32_t getResult(cv::Mat &mat, PoseEngine::Result &result);
}

#endif
