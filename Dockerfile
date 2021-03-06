FROM bigrocs/golang-gcc:1.13 as builder
WORKDIR /go/src/github.com/lecec/lecec/userApi
COPY . .
ENV GOPROXY=https://goproxy.cn
ENV GO111MODULE=on CGO_ENABLED=1 GOOS=linux GOARCH=amd64
RUN go build -a -installsuffix cgo -o bin/userApi

FROM bigrocs/alpine:ca-data
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY --from=builder /go/src/github.com/lecec/lecec/userApi/bin/userApi /usr/local/bin/
ENTRYPOINT ["userApi"]
EXPOSE 8080