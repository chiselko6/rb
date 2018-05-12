Rails.application.routes.draw do

  resources :reservation2_rooms
  resources :reservation2_services
  resources :rooms
  resources :services
  resources :reservations
  resources :users

  get 'total_cost/:user', to: 'users#get_total_reservation_cost', :defaults => { :format => 'json' }
  # http://localhost:3000/total_cost/1 == 2550
  # http://localhost:3000/total_cost/2 == 3610
  # http://localhost:3000/total_cost/3 == 2740
  get 'income/:date', to: 'reservations#date_income', :defaults => { :format => 'json' }
  # http://localhost:3000/income/2018-05-10 == 350
  # http://localhost:3000/income/2018-03-10 == 0
  get 'income/:date_from/:date_to', to: 'reservations#date_income', :defaults => { :format => 'json' }
  # http://localhost:3000/income/2018-05-10/2018-05-12 = 1710
  # http://localhost:3000/income/2018-05-10/2018-05-14 = 2720
  # http://localhost:3000/income/2018-05-10/2018-05-20 = 2720
  get 'is_free/:room_id/:date', to: 'rooms#is_free', :defaults => { :format => 'json' }
  # http://localhost:3000/is_free/2/2018-05-18 == true
  # http://localhost:3000/is_free/3/2018-05-18 == false
  # http://localhost:3000/is_free/3/2018-05-17 == false
  get 'free_rooms/:date', to: 'rooms#free_rooms', :defaults => { :format => 'json' }
  # http://localhost:3000/free_rooms/2018-05-17 =
    # [{"id":1,"num":201,"rooms_count":2,"price":310,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"},
    #   {"id":2,"num":202,"rooms_count":2,"price":320,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"},
    #   {"id":4,"num":204,"rooms_count":3,"price":340,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"},
    #   {"id":5,"num":205,"rooms_count":3,"price":350,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"}]
  # http://localhost:3000/free_rooms/2018-05-11 =
    # [{"id":1,"num":201,"rooms_count":2,"price":310,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"},
    #   {"id":2,"num":202,"rooms_count":2,"price":320,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"},
    #   {"id":4,"num":204,"rooms_count":3,"price":340,"created_at":"2018-05-10T00:00:00.000Z","updated_at":"2018-05-10T00:00:00.000Z"}]
  get 'saved_by_promo/:user', to: 'users#total_saved_by_promo', :defaults => { :format => 'json' }
  # http://localhost:3000/saved_by_promo/1 == 0
  get 'has_promo/:user', to: 'users#has_promo', :defaults => { :format => 'json' }
  # http://localhost:3000/has_promo/1 == true
  # http://localhost:3000/has_promo/2 == true

end
