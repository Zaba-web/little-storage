module model

import db.pg
import crypto.md5

@[table: 'users']
pub struct User {
pub:
	id int @[primary; sql: serial]
pub mut:
	email string @[unique]
	first_name string
	last_name string
	password string
	approved bool
  created_at string @[default: 'CURRENT_TIMESTAMP'; sql_type: 'TIMESTAMP']
}

pub struct UserCreds {
	email string @[required]
	password string @[required]
}

fn User.init_table(db pg.DB) {
	sql db {
		create table User
	} or {
		panic(err)
	}
}

pub fn User.load_by_creds(creds UserCreds, db pg.DB) User {
	user := sql db {
		select from User where email == creds.email && password == hash_password(creds.password)
	} or {
		return User{}
	}

	if user.len == 0 {
		return User{}
	}

	return user.first()
}

pub fn User.get_by_id(id int, db pg.DB) User {
	user := sql db {
		select from User where id == id
	} or {
		return User{}
	}

	if user.len == 0 {
		return User{}
	}

	return user.first()
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
	u.preprocess()

	if u.id == 0 { // new customer should be created
		return u.create_new(db)
	}

	return 0
}

pub fn (u User) approve(db pg.DB) bool {
	sql db {
		update User set approved = true where id == u.id
	} or {
		return false
	}

	return true
}

fn (u User) create_new(db pg.DB) int {
	return sql db {
		insert u into User
	} or {
		return 0
	}
}

fn (mut u User) preprocess() {
	u.password = hash_password(u.password)
	u.approved = false
}

fn hash_password(password string) string {
	return md5.hexhash(password)
}
