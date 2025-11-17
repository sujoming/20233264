이 리포지토리는 YOLOv3 객체 검출 시스템(Darknet)을 Docker로 패키징한 것입니다.

## Build
docker build -t sujoming/yolo:latest .

## Run
docker run --name yolo_test sujoming/yolo:latest <Image URL>    // YOLO를 실행하고 결과 파일을 컨테이너 안에 보관해 놓는 단계
docker cp yolo_test:/darknet/predictions.jpg ~/yolo-docker/     // 컨테이너 안에서 이미지 감지 결과인 predictions.jpg를 로컬 컴퓨터로 가져옴
docker rm yolo_test                                             // YOLO 실행 후 남아있던 yolo_test 컨테이너를 삭제함
