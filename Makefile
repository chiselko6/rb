all: models

models:
	rails generate scaffold User name:string
	rails generate scaffold Reservation user:references date_in:date date_out:date
	rails generate scaffold Service name:string price:integer
	rails generate scaffold Room num:integer rooms_count:integer price:integer

	rails generate scaffold Reservation2Service reservation:references service:references promo:integer
	rails generate scaffold Reservation2Room reservation:references room:references promo:integer

clean-db:
	rm db/development.sqlite3

install:
	rake db:migrate

deploy:
	sqlite3 -echo db/development.sqlite3 "INSERT INTO rooms(num, rooms_count, price, created_at, updated_at) VALUES\
		(201, 2, 310, '2018-05-10', '2018-05-10'),\
		(202, 2, 320, '2018-05-10', '2018-05-10'),\
		(203, 2, 330, '2018-05-10', '2018-05-10'),\
		(204, 3, 340, '2018-05-10', '2018-05-10'),\
		(205, 3, 350, '2018-05-10', '2018-05-10')\
	"
	sqlite3 -echo db/development.sqlite3 "INSERT INTO services(name, price, created_at, updated_at) VALUES\
		('Massage', 200, '2018-05-10', '2018-05-10'),\
		('PS4', 210, '2018-05-10', '2018-05-10'),\
		('FIFA14', 220, '2018-05-10', '2018-05-10'),\
		('PES2018', 230, '2018-05-10', '2018-05-10')\
	"
	sqlite3 -echo db/development.sqlite3 "INSERT INTO users(name, created_at, updated_at) VALUES\
		('user1', '2018-05-10', '2018-05-10'),\
		('user2', '2018-05-10', '2018-05-10'),\
		('user3', '2018-05-10', '2018-05-10')\
	"
	sqlite3 -echo db/development.sqlite3 "INSERT INTO reservations(user_id, date_in, date_out, created_at, updated_at) VALUES\
		(1, '2018-06-09', '2018-06-11', '2018-05-10', '2018-05-10'),\
		(2, '2018-05-11', '2018-05-15', '2018-05-10', '2018-05-10'),\
		(2, '2018-05-17', '2018-05-20', '2018-05-10', '2018-05-10'),\
		(3, '2018-05-08', '2018-05-13', '2018-05-10', '2018-05-10')\
	"
	sqlite3 -echo db/development.sqlite3 "INSERT INTO reservation2_rooms(reservation_id, room_id, created_at, updated_at) VALUES\
		(1, 1, '2018-05-10', '2018-05-10'),\
		(1, 3, '2018-05-10', '2018-05-10'),\
		(2, 3, '2018-05-10', '2018-05-10'),\
		(3, 3, '2018-05-10', '2018-05-10'),\
		(4, 5, '2018-05-10', '2018-05-10')\
	"
	sqlite3 -echo db/development.sqlite3 "INSERT INTO reservation2_services(reservation_id, service_id, created_at, updated_at) VALUES\
		(1, 1, '2018-05-10', '2018-05-10'),\
		(1, 2, '2018-05-10', '2018-05-10'),\
		(1, 3, '2018-05-10', '2018-05-10'),\
		(2, 1, '2018-05-10', '2018-05-10'),\
		(2, 2, '2018-05-10', '2018-05-10'),\
		(3, 4, '2018-05-10', '2018-05-10'),\
		(4, 1, '2018-05-10', '2018-05-10'),\
		(4, 2, '2018-05-10', '2018-05-10'),\
		(4, 4, '2018-05-10', '2018-05-10')\
	"
