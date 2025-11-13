# Dockerfile for YOLOv3 (Darknet)
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git wget build-essential libopencv-dev ca-certificates \
    python3 python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /darknet

# Darknet 소스 클론
RUN git clone https://github.com/pjreddie/darknet.git /darknet

WORKDIR /darknet

# CPU 빌드: Makefile 설정 조정
RUN sed -i 's/GPU=1/GPU=0/' Makefile || true
RUN sed -i 's/CUDNN=1/CUDNN=0/' Makefile || true
RUN sed -i 's/OPENCV=0/OPENCV=1/' Makefile || true

RUN make -j$(nproc)

# yolov3 weights 다운로드
RUN wget -q -O yolov3.weights https://pjreddie.com/media/files/yolov3.weights

# 실행 스크립트 복사
COPY run_yolo.sh /usr/local/bin/run_yolo.sh
RUN chmod +x /usr/local/bin/run_yolo.sh

ENTRYPOINT ["/usr/local/bin/run_yolo.sh"]
CMD []

