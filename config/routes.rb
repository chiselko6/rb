Rails.application.routes.draw do

  resources :reservation2_rooms
  resources :reservation2_services
  resources :rooms
  resources :services
  resources :reservations
  resources :users

  get 'total_cost/:user', to: 'users#get_total_reservation_cost', :defaults => { :format => 'json' }
  # http://localhost:3000/total_cost/1 == 2540
  # http://localhost:3000/total_cost/2 == 4640
  # http://localhost:3000/total_cost/3 == 4950
  get 'income/:date', to: 'reservations#date_income', :defaults => { :format => 'json' }
  # http://localhost:3000/income/2018-05-10 == 7910
  # http://localhost:3000/income/2018-03-10 == 0
  get 'income/:date_from/:date_to', to: 'reservations#date_income', :defaults => { :format => 'json' }
  # http://localhost:3000/income/2018-05-10/2018-05-12 = 7910
  # http://localhost:3000/income/2018-05-10/2018-05-14 = 9590
  get 'is_free/:room_id/:date', to: 'rooms#is_free', :defaults => { :format => 'json' }
  # http://localhost:3000/is_free/2/2018-05-18 == true
  # http://localhost:3000/is_free/3/2018-05-18 == true
  # http://localhost:3000/is_free/3/2018-05-17 == false
  get 'free_rooms/:date', to: 'rooms#free_rooms', :defaults => { :format => 'json' }

end
