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
