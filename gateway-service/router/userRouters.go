package router

import (
	"fmt"
	"little-storage/gateway-service/config"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/proxy"
)

const (
	USER_CREATE_ROUTE = "user"
)

func setupUserRoutes(a *fiber.App) {
	USER := a.Group("user")
	USER.Post("/register", proxy.Forward(fmt.Sprintf("%s%s", config.USER_SERVICE, USER_CREATE_ROUTE)))
}
