package router

import "github.com/gofiber/fiber/v2"

func SetupRoutes(a *fiber.App) {
	setupUserRoutes(a)
}
