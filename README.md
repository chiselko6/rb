# Hostel Reservation

* Ruby version: `ruby 2.5.0p0`

* Configuration: rails standard

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
  - Standard resources:
    - `users`
    - `reservations`
    - `services`
    - `rooms`
    - `reservation2_services`
    - `reservation2_rooms`
  - `/total_cost/:user` - calculates total expenses of the given user across all his reserved services + rooms
  
    Default deployed data should result it:
    - `/total_cost/1` -> `2540`
    - `/total_cost/2` -> `4640`
    - `/total_cost/3` -> `4950`
  - `/income/:date` - calculates hostel's income at a given date (includes all rooms + services reserved at that time)
  
    Default deployed data should result it:
    - `/income/2018-05-10` -> `7910`
    - `/income/2018-03-10` -> `0`
  - `/income/:date_from/:date_to` - calculates hostel's income at a specified date range across all reserved rooms + services falling in this period
    
    Default deployed data should result it:
    - `/income/2018-05-10/2018-05-12` -> `7910`
    - `/income/2018-05-10/2018-05-14` -> `9590`
  - `/is_free/:room_id/:date` - checks whether room with *room_id* is available at a given date
    
    Default deployed data should result it:
    - `/is_free/2/2018-05-18` -> `true`
    - `/is_free/3/2018-05-18` -> `true`
    - `/is_free/3/2018-05-17` -> `false`
