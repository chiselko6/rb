all: models

models:
	rails generate scaffold User name:string
	rails generate scaffold Reservation user:references date_in:date date_out:date
	rails generate scaffold Service name:string price:integer
	rails generate scaffold Room num:integer rooms_count:integer price:integer

	rails generate scaffold Reservation2Service reservation:references service:references
	rails generate scaffold Reservation2Room reservation:references room:references

install:
	rake db:migrate

deploy:
	sqlite3 -echo db/development.sqlite3 "INSERT INTO rooms(num, rooms_count, price, created_at, updated_at) VALUES
		(201, 2, 310, DATETIME('now'), DATETIME('now')),
		(202, 2, 320, DATETIME('now'), DATETIME('now')),
		(203, 2, 330, DATETIME('now'), DATETIME('now')),
		(204, 3, 340, DATETIME('now'), DATETIME('now')),
		(205, 3, 350, DATETIME('now'), DATETIME('now'))
	"
	sqlite3 -echo db/development.sqlite3 "INSERT INTO services(name, created_at, updated_at) VALUES
		('Massage', DATETIME('now'), DATETIME('now')),
		('PS4', DATETIME('now'), DATETIME('now')),
		('FIFA14', DATETIME('now'), DATETIME('now')),
		('PES2018', DATETIME('now'), DATETIME('now'))
	"
	sqlite3 -echo db/development.sqlite3 "INSERT INTO users(name, created_at, updated_at) VALUES
		('user1', DATETIME('now'), DATETIME('now')),
		('user2', DATETIME('now'), DATETIME('now')),
		('user3', DATETIME('now'), DATETIME('now'))
	"
	sqlite3 -echo db/development.sqlite3 "INSERT INTO reservations(user_id, date_in, date_out, created_at, updated_at) VALUES
		(1, DATE('now', '+1 month', '-1 day'), DATE('now', '+1 month', '+1 day'), DATETIME('now'), DATETIME('now')),
		(2, DATE('now', '+1 day'), DATE('now', '+5 days'), DATETIME('now'), DATETIME('now')),
		(3, DATE('now', '-2 days'), DATE('now', '+3 days'), DATETIME('now'), DATETIME('now'))
	"
	sqlite3 -echo db/development.sqlite3 "INSERT INTO reservation2_rooms(reservation_id, room_id, created_at, updated_at) VALUES
		(1, 1, DATETIME('now'), DATETIME('now')),
		(1, 3, DATETIME('now'), DATETIME('now')),
		(3, 2, DATETIME('now'), DATETIME('now'))
	"
	sqlite3 -echo db/development.sqlite3 "INSERT INTO reservation2_services(reservation_id, service_id, created_at, updated_at) VALUES
		(2, 1, DATETIME('now'), DATETIME('now')),
		(2, 2, DATETIME('now'), DATETIME('now')),
		(2, 3, DATETIME('now'), DATETIME('now'))
	"
