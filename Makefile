
.PHONY: git
git:
	git add .
	git commit -m"自动提交 git 代码"
	git push
.PHONY: run
run:
	go run main.go
.PHONY: build
build:
	docker build -f Dockerfile  -t userApi .
.PHONY: proto
proto:
	# protoc -I . --gogofaster_out=. proto/health/health.proto
	protoc -I . --gogofaster_out=plugins=grpc:. proto/health/health.proto
