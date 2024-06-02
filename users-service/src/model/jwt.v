module model

import elitru.jwt
import db.pg
import os

const access_token_lifetime = 60 * 60 // one hour
const refresh_token_lifetime = 60 * 60 * 24 * 7 // one week
const jwt_salt = os.getenv("JWT_SALT")

struct AccessClaims {
	id int
	email string
	first_name string
	last_name string
	created_at string
}

struct RefreshClaims {
	id int
}

struct TokenPair {
	access string
	refresh string
}

fn AccessClaims.from_user(user User) AccessClaims {
	return AccessClaims{
		id: user.id
		email: user.email
		first_name: user.first_name
		last_name: user.last_name
		created_at: user.created_at
	}
}

fn RefreshClaims.init(id int) RefreshClaims {
	return RefreshClaims{
		id: id
	}
}

pub fn create_token_pair(user User, db pg.DB) TokenPair {
	alg := jwt.new_algorithm(jwt.AlgorithmType.hs256)

	access_token := jwt.encode<AccessClaims>(AccessClaims.from_user(user), alg, jwt_salt, access_token_lifetime) or {
		return TokenPair{}
	}
	refresh_token := jwt.encode<RefreshClaims>(RefreshClaims.init(user.id), alg, jwt_salt, refresh_token_lifetime) or {
		return TokenPair{}
	}

	RefreshToken.save(user.id, refresh_token, db)

	return TokenPair {
		access: access_token
		refresh: refresh_token
	}
}
