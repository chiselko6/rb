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

    Default deployed data should result in:
    - `/total_cost/1` -> `2550`
    - `/total_cost/2` -> `3610`
    - `/total_cost/3` -> `2740`
  - `/income/:date` - calculates hostel's income at a given date (includes all rooms + services reserved at that time)

    Default deployed data should result in:
    - `/income/2018-05-10` -> `350`
    - `/income/2018-03-10` -> `0`
  - `/income/:date_from/:date_to` - calculates hostel's income at a specified date range across all reserved rooms + services falling in this period

    Default deployed data should result in:
    - `/income/2018-05-10/2018-05-12` -> `1710`
    - `/income/2018-05-10/2018-05-14` -> `2720`
    - `/income/2018-05-10/2018-05-20` -> `2720`
  - `/is_free/:room_id/:date` - checks whether room with *room_id* is available at a given date

    Default deployed data should result in:
    - `/is_free/2/2018-05-18` -> `true`
    - `/is_free/3/2018-05-18` -> `false`
    - `/is_free/3/2018-05-17` -> `false`

  - `/free_rooms/:date` - gets the list of available rooms to be booked

    Default deployed data should result in:
    - `/free_rooms/2018-05-17` ->
      ```[{"id":1,"num":201,"rooms_count":2,"price":310,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"},
      {"id":2,"num":202,"rooms_count":2,"price":320,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"},
      {"id":4,"num":204,"rooms_count":3,"price":340,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"},
      {"id":5,"num":205,"rooms_count":3,"price":350,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"}]

    - `/free_rooms/2018-05-11` ->
      ```[{"id":1,"num":201,"rooms_count":2,"price":310,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"},
      {"id":2,"num":202,"rooms_count":2,"price":320,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"},
      {"id":4,"num":204,"rooms_count":3,"price":340,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"}]

* UI Testing:
  - Promo:
    - After starting app, one can create a new reservation in `/reservations/new` with *user_id=1* and some valid dates
    - Then go to `/reservation2_rooms/new` and book a room with *reservation_id=5*, *room_id=4*
    - Now, you should go to `/total_cost/1` and see *3094*, as **promo** was activated for this user
