package middleware

import (
	"little-storage/gateway-service/services"

	"github.com/gofiber/fiber/v2"
)

func Auth(c *fiber.Ctx) error {
	token := c.Get("Authorization")
	loggedIn, userResponse := services.GetAuth(token)

	if !loggedIn || userResponse.Status == 401 {
		return c.Status(fiber.StatusUnauthorized).JSON("{}")
	}

	return c.Next()
}
