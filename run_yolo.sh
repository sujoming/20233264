#!/bin/bash

# 이미지 주소 안 넣으면 종료
if [ -z "$1" ]; then
    echo "사용법: docker run --rm -v <host_dir>:/darknet <image> <이미지_URL>"
    exit 1
fi

IMG_URL="$1"
IMG_NAME="input.jpg"

# 이미지 다운로드
echo "이미지 다운로드 중..."
wget --no-check-certificate -O "$IMG_NAME" "$IMG_URL"
if [ $? -ne 0 ]; then
    echo "이미지 다운로드 실패"
    exit 2
fi

# YOLO 실행
echo "YOLOv3 실행..."
./darknet detector test cfg/coco.data cfg/yolov3.cfg yolov3.weights "$IMG_NAME" -dont_show

# 결과 확인
if [ -f predictions.jpg ]; then
    echo "완료: predictions.jpg 생성됨"
else
    echo "predictions.jpg 생성 안 됨"
fi
