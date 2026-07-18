all: image

arm: 
	docker buildx build -t yf-phantun:latest --platform linux/armhf --output type=docker --load  .
	docker save yf-phantun:latest --output yf-phantun-armv7.tar
	docker rmi yf-phantun:latest

arm64: 
	docker buildx build -t yf-phantun:latest --platform linux/aarch64 --output type=docker --load  .
	docker save yf-phantun:latest --output yf-phantun-aarch64.tar
	docker rmi yf-phantun:latest

image: 
	docker buildx build -t yf-phantun:latest --platform linux/x86_64 --output type=docker --load  .
	docker save yf-phantun:latest --output yf-phantun_x64.tar
	docker rmi yf-phantun:latest

download: phantun_client_x86_64
	./download.sh x86_64
	./download.sh aarch64
	./download.sh armv7

clean:
	rm -f phantun_￼client_* *.tar
