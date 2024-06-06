package router

import (
	"fmt"
	"little-storage/gateway-service/config"
	"little-storage/gateway-service/middleware"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/proxy"
)

const (
	USER_CREATE_ROUTE  = "register"
	USER_LOGIN_ROUTE   = "login"
	USER_TOKEN_REFRESH = "refresh"
)

func setupUserRoutes(a *fiber.App) {
	USER := a.Group("user")
	USER.Post("/register", proxy.Forward(fmt.Sprintf("%s%s", config.USER_SERVICE, USER_CREATE_ROUTE)))
	USER.Post("/login", proxy.Forward(fmt.Sprintf("%s%s", config.USER_SERVICE, USER_LOGIN_ROUTE)))
	USER.Post("/refresh", proxy.Forward(fmt.Sprintf("%s%s", config.USER_SERVICE, USER_TOKEN_REFRESH)))

	USER_PRIVATE := USER.Use(middleware.Auth)
	USER_PRIVATE.Get("/todo", func(c *fiber.Ctx) error {
		return c.JSON("todo")
	}) // to be used
}
