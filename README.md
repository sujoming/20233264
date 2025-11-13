이 리포지토리는 YOLOv3 객체 검출 시스템(Darknet)을 Docker로 패키징한 것입니다.

## 🧩 Build 방법
\`\`\`bash
docker build -t <your_dockerhub_id>/yolo:latest .
\`\`\`

## 🚀 실행 방법
로컬 폴더(`~/yolo-output`)에 결과 이미지를 저장하려면:
\`\`\`bash
mkdir -p ~/yolo-output
docker run --rm -v ~/yolo-output:/darknet <your_dockerhub_id>/yolo:latest https://upload.wikimedia.org/wikipedia/commons/4/45/A_small_cup_of_coffee.JPG
\`\`\`

실행이 완료되면 `~/yolo-output/predictions.jpg` 파일이 생성됩니다.

## 📎 참고 자료
- Darknet: https://github.com/pjreddie/darknet  
- YOLOv3 Paper: https://arxiv.org/abs/1804.02767  
- YOLOv3 Demo: https://pjreddie.com/darknet/yolo/
