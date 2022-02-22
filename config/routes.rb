Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :workspaces, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
    # in order to make a booking, i need two relationships:
    # 1. USER - we always have that because is signed in with a cookie
    # 2. WORKSPACE — we're only gonna know which one it is is if it's in the URL

    # new: localhost:3000/workspaces/2/bookings/new
    # create: localhost:3000/workspaces/2/bookings/
    # 2 ^ params[:workspace_id]
  end

  resources :bookings, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
