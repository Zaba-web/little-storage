package services

import (
	"encoding/json"
	"fmt"
	"io"
	"little-storage/gateway-service/config"
	"net/http"
	"time"
)

const (
	USER_AUTH_ROUTE = "auth"
	AUTHORIZATION   = "Authorization"
)

type UserResponse struct {
	Status   int    `json:"status"`
	Response string `json:"response"`
}

func GetAuth(token string) (bool, UserResponse) {
	req, err := http.NewRequest(http.MethodGet, fmt.Sprintf("%s%s", config.USER_SERVICE, USER_AUTH_ROUTE), nil)

	if err != nil {
		return false, UserResponse{
			Status:   401,
			Response: "{}",
		}
	}

	req.Header.Set(AUTHORIZATION, token)

	client := http.Client{
		Timeout: 30 * time.Second,
	}

	res, err := client.Do(req)

	if err != nil {
		return false, UserResponse{
			Status:   401,
			Response: "{}",
		}
	}

	responseText, err := io.ReadAll(res.Body)

	var resp UserResponse

	json.Unmarshal(responseText, &resp)

	return true, resp
}
