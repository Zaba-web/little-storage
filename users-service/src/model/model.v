module model

import db.pg

pub fn init_tables(db pg.DB) {
	User.init_table(db)
}
