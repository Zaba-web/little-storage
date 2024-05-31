module model

import db.pg
import crypto.md5

@[table: 'users']
pub struct User {
	id int @[primary; sql: serial]
mut:
	email string @[unique]
	first_name string
	last_name string
	password string
	approved bool
  created_at string @[default: 'CURRENT_TIMESTAMP'; sql_type: 'TIMESTAMP']
}

fn User.init_table(db pg.DB) {
	sql db {
		create table User
	} or {
		panic(err)
	}
}

pub fn (u User) is_already_registered(db pg.DB) bool {
	found_result := sql db {
		select from User where email == u.email
	} or {
		return false
	}

	return found_result.len > 0
}

pub fn (mut u User) save(db pg.DB) int {
	u.process_password()

	if u.id == 0 { // new customer should be created
		return u.create_new(db)
	}

	return 0
}

fn (u User) create_new(db pg.DB) int {
	return sql db {
		insert u into User
	} or {
		return 0
	}
}

fn (mut u User) process_password() {
	u.password = md5.hexhash(u.password)
}
