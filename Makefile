build:
	docker build -t holms/ruby-ree-alpine:latest -f Dockerfile .
	docker login
	docker push holms/ruby-ree-alpine:latest
