Rails.application.routes.draw do

  resources :reservation2_rooms
  resources :reservation2_services
  resources :rooms
  resources :services
  resources :reservations
  resources :users

  get 'total_cost/:user', to: 'users#get_total_reservation_cost', :defaults => { :format => 'json' }

end
