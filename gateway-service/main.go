package main

import (
	"little-storage/gateway-service/router"
	"log"

	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()
	router.SetupRoutes(app)

	log.Fatal(app.Listen(":8181"))
}
