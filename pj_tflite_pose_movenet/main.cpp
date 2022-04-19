#include <cstdint>
#include <string>
#include <opencv2/opencv.hpp>
#include "image_processor.h"
#include "common_helper_cv.h"
#include <pthread.h>
#include <unistd.h>

/*** Macro ***/
#define WORK_DIR                      RESOURCE_DIR
#define DEFAULT_INPUT_IMAGE           "0"
#define LOOP_NUM_FOR_TIME_MEASUREMENT 10


void* checkFall(void *test){
    bool fall_flag;
    cv::Mat image;
    cv::VideoCapture cap= *(cv::VideoCapture *) test;

    //0 nose
    //13 14 kolana
    //15 16 kostki

    while(true){
        if (cap.isOpened()) {
            cap.read(image);
        }
        if (image.empty()) break;

        PoseEngine::Result_ result1, result2;
        ImageProcessor::getResult(image, result1);

        float headHight1, headHight2;
        float kneeHight1, kneeHight2;
        float height1, height2;

        headHight1 = result1.keypoint_list[0][0].second;
        kneeHight1 = (result1.keypoint_list[0][13].second + result1.keypoint_list[0][14].second)/2;
        std::cout<< headHight1<<std::endl;

        sleep(1);

        if (cap.isOpened()) {
            cap.read(image);
        }
        if (image.empty()) break;
        ImageProcessor::getResult(image, result2);

        headHight2 = result2.keypoint_list[0][0].second;
        kneeHight2 = (result2.keypoint_list[0][13].second + result2.keypoint_list[0][14].second)/2;

        height1=kneeHight1-headHight1;
        height2=kneeHight2-headHight2;


        std::cout << "headHight1: " << headHight1 << std::endl;
        std::cout << "headHight2: " << headHight2 << std::endl;
        std::cout << "height1: " << height1 << std::endl;
        std::cout << "height2: " << height2 << std::endl;


        fall_flag = height2 < 0.5 * height1;

        if(fall_flag){
            std::cout << "Fall Detected" << std::endl;
            fall_flag = false;
        }

        if (cap.isOpened()) {
            //q
            if (CommonHelper::InputKeyCommand(cap)) break;
        }
    }

    return nullptr;
}

void* display(void *arg){

    cv::VideoCapture cap= *(cv::VideoCapture *) arg;

    int32_t frame_cnt = 0;
    for (frame_cnt = 0; cap.isOpened() || frame_cnt < LOOP_NUM_FOR_TIME_MEASUREMENT; frame_cnt++) {
        /*read image*/
        cv::Mat image;
        if (cap.isOpened()) {
            cap.read(image);
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
        }

    }
}

/*** Function ***/
int32_t main(int argc, char* argv[]){

    /* Find source image */
    std::string input_name = (argc > 1) ? argv[1] : DEFAULT_INPUT_IMAGE;
    //std::string input_name = "0";
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

    pthread_t displayThread, checkFallThread;
    bool checkError = pthread_create(&displayThread, nullptr, display, &cap);
    assert(!checkError);

    checkError = pthread_create(&checkFallThread, nullptr, checkFall, &cap);
    assert(!checkError);

    checkError = pthread_join(displayThread, nullptr);
    assert(!checkError);

    checkError = pthread_join(checkFallThread, nullptr);
    assert(!checkError);

    /* Fianlize image processor library */
    ImageProcessor::Finalize();
    cv::waitKey(-1);

    return 0;
}
