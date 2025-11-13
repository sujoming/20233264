
if [ -z "$1" ]; then
  echo "Usage: docker run --rm -v <host_dir>:/darknet <image> IMAGE_URL"
  exit 1
fi

IMG_URL="$1"
IMG_NAME="input.jpg"

# 이미지 다운로드
wget -q -O "$IMG_NAME" "$IMG_URL" || { echo "Failed to download image"; exit 2; }

# YOLOv3 실행 (결과: predictions.jpg)
./darknet detector test cfg/coco.data cfg/yolov3.cfg yolov3.weights "$IMG_NAME" -dont_show

# 결과 확인
if [ -f predictions.jpg ]; then
  echo "✅ Detection finished. predictions.jpg saved."
  ls -lh predictions.jpg
else
  echo "❌ No predictions.jpg created; check darknet output."
fi
