#include <cstdint>
#include <cstdlib>
#include <cmath>
#include <cstring>
#include <memory>
#include <string>
#include <vector>
#include <chrono>
#include <opencv2/opencv.hpp>
#include "common_helper.h"
#include "common_helper_cv.h"
#include "pose_engine.h"
#include "image_processor.h"

/*** Macro ***/
#define TAG "ImageProcessor"
#define PRINT(...)   COMMON_HELPER_PRINT(TAG, __VA_ARGS__)
#define PRINT_E(...) COMMON_HELPER_PRINT_E(TAG, __VA_ARGS__)

/*** Global variable ***/
std::unique_ptr<PoseEngine> s_engine;

/*** Function ***/
static void
DrawFps(cv::Mat &mat, double time_inference, cv::Point pos){
    char text[64];
    static auto time_previous = std::chrono::steady_clock::now();
    auto time_now = std::chrono::steady_clock::now();
    double fps = 1e9 / (time_now - time_previous).count();
    time_previous = time_now;
    snprintf(text, sizeof(text), "FPS: %.1f, Inference: %.1f [ms]", fps, time_inference);
    CommonHelper::DrawText(mat, text, cv::Point(0, 0), 0.5, 2, CommonHelper::CreateCvColor(0, 0, 0), CommonHelper::CreateCvColor(180, 180, 180), true);
}


int32_t ImageProcessor::Initialize(const ImageProcessor::InputParam& input_param){
    if (s_engine) {
        PRINT_E("Already initialized\n");
        return -1;
    }

    s_engine = std::make_unique<PoseEngine>();
    if (s_engine->Initialize(input_param.work_dir, input_param.num_threads) != PoseEngine::kRetOk) {
        s_engine->Finalize();
        s_engine.reset();
        return -1;
    }
    return 0;
}

int32_t ImageProcessor::Finalize(){
    if (!s_engine) {
        PRINT_E("Not initialized\n");
        return -1;
    }

    if (s_engine->Finalize() != PoseEngine::kRetOk) {
        return -1;
    }

    return 0;
}


int32_t ImageProcessor::Command(int32_t cmd){
    if (!s_engine) {
        PRINT_E("Not initialized\n");
        return -1;
    }

    switch (cmd) {
    case 0:
    default:
        PRINT_E("command(%d) is not supported\n", cmd);
        return -1;
    }
}

static const std::vector<std::pair<int32_t, int32_t>> kJointLineList {
    /* face */
    {0, 2},
    {2, 4},
    {0, 1},
    {1, 3},
    /* body */
    {6, 5},
    {5, 11},
    {11, 12},
    {12, 6},
    /* arm */
    {6, 8},
    {8, 10},
    {5, 7},
    {7, 9},
    /* leg */
    {12, 14},
    {14, 16},
    {11, 13},
    {13, 15},
};

static constexpr float kThresholdScoreKeyPoint = 0.2f;

int32_t ImageProcessor::getResult(cv::Mat& mat, PoseEngine::Result& result){
    if (s_engine->Process(mat, result) != PoseEngine::kRetOk) {
        return -1;
    }else{
        return 1;
    }
}

int32_t ImageProcessor::Process(cv::Mat& mat, ImageProcessor::Result& result){
    if (!s_engine) {
        PRINT_E("Not initialized\n");
        return -1;
    }

    PoseEngine::Result pose_result;
    if (s_engine->Process(mat, pose_result) != PoseEngine::kRetOk) {
        return -1;
    }



    /* Display target area  */
    cv::rectangle(mat, cv::Rect(pose_result.crop.x, pose_result.crop.y, pose_result.crop.w, pose_result.crop.h), CommonHelper::CreateCvColor(0, 0, 0), 2);

    /* Display detection result and keypoint */
    for (size_t i = 0; i < 1; i++) {

        /* Display joint lines */
        const auto& keypoint = pose_result.keypoint_list[i];
        const auto& keypoint_score = pose_result.keypoint_score_list[i];
        for (const auto& jointLine : kJointLineList) {
            if (keypoint_score[jointLine.first] >= kThresholdScoreKeyPoint && keypoint_score[jointLine.second] >= kThresholdScoreKeyPoint) {
                int32_t x0 = keypoint[jointLine.first].first;
                int32_t y0 = keypoint[jointLine.first].second;
                int32_t x1 = keypoint[jointLine.second].first;
                int32_t y1 = keypoint[jointLine.second].second;
                cv::line(mat, cv::Point(x0, y0), cv::Point(x1, y1), CommonHelper::CreateCvColor(200, 200, 200), 2);
            }
        }

        /* Display joints */
        for (size_t j = 0; j < keypoint.size(); j++) {
            if (keypoint_score[j] >= kThresholdScoreKeyPoint) {
                const auto& p = keypoint[j];
                cv::circle(mat, cv::Point(p.first, p.second), 2, CommonHelper::CreateCvColor(0, 255, 0));
            }        }
    }


    DrawFps(mat, pose_result.time_inference, cv::Point(0, 0));
    result.time_inference = pose_result.time_inference;


    return 0;
}
