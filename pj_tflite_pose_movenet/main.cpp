#include <cstdint>
#include <string>
#include <opencv2/opencv.hpp>
#include "image_processor.h"
#include "common_helper_cv.h"
#include <pthread.h>
#include <unistd.h>

/*** Macro ***/
#define WORK_DIR                      RESOURCE_DIR
#define DEFAULT_INPUT_IMAGE           0
#define LOOP_NUM_FOR_TIME_MEASUREMENT 10


void* checkFall(void *test){
    bool fall_flag;
    cv::Mat image;
    cv::VideoCapture cap= *(cv::VideoCapture *) test;

    //0 nose
    //13 14 kolana
    //15 16 kostki

    while(fall_flag){
        if (cap.isOpened()) {
            cap.read(image);
        } else {
            image = cv::imread(0);
        }
        if (image.empty()) break;

        PoseEngine::Result_ result1, result2;
        ImageProcessor::getResult(image, result1);

        float headHight1, headHight2;
        float kneeHight1, kneeHight2;
        float height1, height2;

        headHight1 = result1.keypoint_list[0][0].second;
        kneeHight1 = (result1.keypoint_list[0][13].second + result1.keypoint_list[0][14].second)/2;

        sleep(1);
        ImageProcessor::getResult(image, result2);

        headHight2 = result2.keypoint_list[0][0].second;
        kneeHight2 = (result2.keypoint_list[0][13].second + result2.keypoint_list[0][14].second)/2;

        height1=headHight1-kneeHight1;
        height2=headHight2-kneeHight2;
        fall_flag = height2 < 0.5 * height1;

        if(fall_flag){
            std::cout << "Fall Detected" << std::endl;
            fall_flag = false;
        }
    }

    return NULL;
}

/*** Function ***/
int32_t main(int argc, char* argv[]){

    /* Find source image */
    std::string input_name = (argc > 1) ? argv[1] : DEFAULT_INPUT_IMAGE;
    cv::VideoCapture cap;   /* if cap is not opened, src is still image */
    if (!CommonHelper::FindSourceImage(input_name, cap)) {
        return -1;
    }

    /* Initialize image processor library */
    ImageProcessor::InputParam input_param = { WORK_DIR, 4 };
    if (ImageProcessor::Initialize(input_param) != 0) {
        printf("Initialization Error\n");
        return -1;
    }

    pthread_t thread;
    int arg;
    bool checkError = pthread_create(&thread, nullptr, checkFall, &cap);
    assert(!checkError);


    /*** Process for each frame ***/
    int32_t frame_cnt = 0;
    for (frame_cnt = 0; cap.isOpened() || frame_cnt < LOOP_NUM_FOR_TIME_MEASUREMENT; frame_cnt++) {
        /*read image*/
        cv::Mat image;
        if (cap.isOpened()) {
            cap.read(image);
        } else {
            image = cv::imread(input_name);
        }
        if (image.empty()) break;

        /* Call image processor library */
        ImageProcessor::Result result;
        ImageProcessor::Process(image, result);

        /* Display result */
        cv::imshow("FallDetector", image);

        /* Input key command */
        if (cap.isOpened()) {
            //q
            if (CommonHelper::InputKeyCommand(cap)) break;
        };

    }

    /* Fianlize image processor library */
    ImageProcessor::Finalize();
    cv::waitKey(-1);

    checkError = pthread_join(thread, nullptr);
    assert(!checkError);

    return 0;
}
