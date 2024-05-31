module main

struct SimpleResponse {
	status u16
	message string
}

const (
	bad_request = 400
	internal_error = 500
	created = 204
	conflict = 409
)
