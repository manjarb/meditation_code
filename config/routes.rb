Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get '/' => 'front_pages#index'

  get 'admin_password_resets/new'
  get 'admin_password_resets/edit'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get 'admin' => 'admin_users#dashboard'
  get 'admin/dashboard' => 'activities#list'
  get 'admin/payment' => 'admin_users#payment'
  #get 'admin/payment/:id/edit' => 'admin_users#edit_bank_account'
  get 'admin/all_users' => 'admin_users#list'
  get 'admin/login' => 'admin_sessions#new'
  post 'admin/login' => 'admin_sessions#create'
  delete 'admin/logout' => 'admin_sessions#destroy'

  get 'admin/temples' => 'temples#list'

  ##### Front Pages Route
  get '/activities' => 'front_pages#activities_list'
  get '/activities/:id' => 'front_pages#activities_details', :as => 'activity_show'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/user/profile' => 'users#user_tabs'
  get '/user/settings' => 'users#user_tabs'
  get '/user/bookings' => 'users#user_tabs'
  get '/user/wishlist' => 'users#user_tabs'
  get '/user/payments' => 'users#user_tabs'
  patch '/user/:id/update_password' => 'users#update_password' , :as => 'update_password'
  ##### Front Pages Route


  resources :admin_users, :only => [:edit,:update,:new,:create,:list,:destroy]
  resources :admin_password_resets, only: [:new, :create, :edit, :update]
  resources :temples, only: [:new, :create, :edit, :update,:list,:destroy]
  resources :activities, only: [:new, :create, :edit, :update,:list,:destroy]
  resources :bank_accounts, only: [:edit,:new,:create,:update,:destroy]
  resources :users,only: [:create,:edit,:new,:update]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  ##### FB LOGIN

  match 'auth/:provider/callback', to: 'sessions#facebook_create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  #get 'signout', to: 'sessions#destroy', as: 'signout'



end
