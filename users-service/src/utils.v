module main

struct SimpleResponse {
	status u16
	response string
}

const (
	bad_request = 400
	internal_error = 500
	created = 204
	ok = 200
	conflict = 409
	unauthorized = 401
	forbidden = 403
)
