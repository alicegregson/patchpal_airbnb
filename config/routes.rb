Rails.application.routes.draw do
  devise_for :users
  root to: 'flats#index'
  resources :flats, except: :index do
    resources :bookings, only: [:new, :create, :index, :show, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
