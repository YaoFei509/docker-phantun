all: image

image: yf-phantun.tar
	docker buildx build -t yf-phantun:latest --output type=docker --load  .
	docker save yf-phantun:latest --output yf-phantun.tar
	docker rmi yf-phantun:latest

download: phantun_client_x86_64
	./download.sh x86_64
	./download.sh aarch64
	./download.sh armv7
