# Hostel Reservation

* Ruby version: `ruby 2.5.0p0`

* Configuration: rails standart

* Database creation: `make install`

* Database initialization: `make deploy`

* Models:

  - **User** 
    - *name*: string
  - **Service** 
    - *name*: string
    - *price*: integer - one-off fee
  - **Room**
    - *num*: integer - appartment number in the hostel
    - *rooms_count*: integer - # rooms in the appartment
    - *price*: integer - one-off fee
  - **Reservation**
    - *user_id*: integer - references **User** having booked something
    - *date_in*: date - when **User** starts using it
    - *date_out*: date - when **User** releases it
  - **Reservation2Service**
    - *reservation_id*: integer - references **Reservation**
    - *service_id*: integer - references **Service**
  - **Reservation2Room**
    - *reservation_id*: integer - references **Reservation**
    - *room_id*: integer - references **Room**
  Each model additionally has common rails fields:
    - *created_at*: datetime
    - *updated_at*: datetime
  
* Routes:
  - Standart resources:
    - `users`
    - `reservations`
    - `services`
    - `rooms`
    - `reservation2_services`
    - `reservation2_rooms`
  - `total_cost/:user` - calculates total expenses of the given user across all his reserved services + rooms
  - `income/:date` - calculates hostel's income at a given date (includes all rooms + services reserved at that time)
  - `income/:date_from/:date_to` - calculates hostel's income at a specified date range across all reserved rooms + services falling in this period
  - `is_free/:room_id/:date` - checks whether room with *room_id* is available at a given date
