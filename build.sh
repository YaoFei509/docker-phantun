docker buildx build -t yf-phantun:latest --output type=docker --load  .
docker save yf-phantun:latest --output yf-phantun.tar
docker rmi yf-phantun:latest
