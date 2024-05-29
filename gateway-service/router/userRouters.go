package router

import (
	"little-storage/gateway-service/handlers"

	"github.com/gofiber/fiber/v2"
)

func setupUserRoutes(a *fiber.App) {
	USER := a.Group("user")
	USER.Post("/", handlers.CreateUser)
}
