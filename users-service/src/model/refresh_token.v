module model

import db.pg

@[table: 'refresh_token']
struct RefreshToken {
	id int @[primary; sql: serial]
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
