module main

import vweb
import model
import json

@['/user'; post]
fn (mut app App) create() vweb.Result {
	mut user := json.decode(model.User, app.req.data) or {
		app.set_status(bad_request, "Bad request")
		return app.json(SimpleResponse{bad_request, "Check your input data"})
	}

	if user.is_already_registered(app.db) {
		app.set_status(conflict, "Conflict")
		return app.json(SimpleResponse{conflict, "User with this email already registered"})
	}

	if user.save(app.db) == 0 {
		app.set_status(internal_error, "Internal error")
		return app.json(SimpleResponse{internal_error, "Server error occured"})
	}

	app.set_status(created, "Created")
	return app.json(SimpleResponse{created, "Created"})
}

@['/login'; post]
fn (mut app App) login() vweb.Result {
	mut user_data := json.decode(model.UserCreds, app.req.data) or {
		app.set_status(bad_request, "Bad request")
		return app.json(SimpleResponse{bad_request, "Provide email and password to log in"})
	}

	user := model.User.load_by_creds(user_data, app.db)

	if user.id == 0 {
		app.set_status(unauthorized, "Unauthorized")
		return app.json(SimpleResponse{unauthorized, "Invalid email or password"})
	}

	if !user.approved {
		app.set_status(forbidden,"Forbidden")
		return app.json(SimpleResponse{forbidden, "Your account haven't been approved yet"})
	}

	token_pair := model.create_token_pair(user, app.db)

	app.set_status(ok, "Created")
	return app.json(SimpleResponse{ok, json.encode(token_pair)})
}
