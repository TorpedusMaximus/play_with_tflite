#include <cstdint>
#include <string>
#include <opencv2/opencv.hpp>
#include "image_processor.h"
#include "common_helper_cv.h"

/*** Macro ***/
#define WORK_DIR                      RESOURCE_DIR
#define DEFAULT_INPUT_IMAGE           0
#define LOOP_NUM_FOR_TIME_MEASUREMENT 10

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

    return 0;
}
