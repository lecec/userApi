package handler

import (
	healthPB "github.com/lecec/userApi/proto/health"
	"google.golang.org/grpc"
)

// Register 注册
func Register(Server *grpc.Server) {
	healthPB.RegisterHealthServer(Server, &Health{})
}
