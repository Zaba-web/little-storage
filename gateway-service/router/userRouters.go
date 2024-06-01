package router

import (
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/proxy"
)

const (
	USER_SERVICE      = "http://user:4000/"
	USER_CREATE_ROUTE = "user"
)

func setupUserRoutes(a *fiber.App) {
	USER := a.Group("user")
	USER.Post("/", proxy.Forward(fmt.Sprintf("%s%s", USER_SERVICE, USER_CREATE_ROUTE)))
}
