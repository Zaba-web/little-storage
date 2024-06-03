module model

import db.pg

@[table: 'refresh_token']
pub struct RefreshToken {
	id int @[primary; sql: serial]
pub:
	user_id int
	token string @[unique]
}

fn RefreshToken.init_table(db pg.DB) {
	sql db {
		create table RefreshToken
	} or {
		panic(err)
	}
}

fn RefreshToken.save(user_id int, token string, db pg.DB) bool {
	token_record := RefreshToken{
		user_id: user_id,
		token: token
	}

	sql db {
		insert token_record into RefreshToken
	} or {
		return false
	}

	return true
}

pub fn RefreshToken.load(token string, db pg.DB) !RefreshToken {
	token_record := sql db {
		select from RefreshToken where token == token
	}!

	if token_record.len > 0 {
		return token_record.first()
	} else {
		return error("Token not found")
	}
}

pub fn(rt RefreshToken) delete(db pg.DB) bool {
	sql db {
		delete from RefreshToken where id == rt.id
	} or {
		return false
	}

	return true
}
