Rails.application.routes.draw do
  resources :bookings
  resources :schedules
  resources :activities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :types
  post 'authenticate', to: 'authentication#authenticate'
end
