module main

import model
import vweb
import db.pg
import os

const app_port = 4000

struct App {
	vweb.Context
mut:
	db pg.DB
}

fn main() {
	db := get_database()
	model.init_tables(db)

	mut app := &App{
		db: db
	}

	vweb.run(app, app_port)
}

fn get_database() pg.DB {
	return pg.connect(
		host: os.getenv("POSTGRES_HOST")
		user: os.getenv("POSTGRES_USER")
		password: os.getenv("POSTGRES_PASSWORD")
		dbname: os.getenv("POSTGRES_DB")
	) or {
 		panic(err)
	}
}
