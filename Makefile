all: models

models:
	rails generate scaffold User name:string
	rails generate scaffold Reservation user:references date_in:date date_out:date
	rails generate scaffold Service name:string
	rails generate scaffold Room num:integer rooms_count:integer price:integer

	rails generate scaffold Reservation2Service reservation:references service:references
	rails generate scaffold Reservation2Room reservation:references room:references

install:
	rake db:migrate
