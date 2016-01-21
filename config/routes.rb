Rails.application.routes.draw do
  scope '/api/v0' do
    resources :bookings
    resources :hotels
    resources :cities
    resources :users do
      get 'bookings', to: 'user_bookings#get'
    end
    get 'user_bookable', to: 'user_bookable#get'
  end
end
