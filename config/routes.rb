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

  resources :admin_users, :only => [:edit,:update,:new,:create,:list,:destroy]
  resources :admin_password_resets, only: [:new, :create, :edit, :update]
  resources :temples, only: [:new, :create, :edit, :update,:list,:destroy]

  resources :bank_accounts, only: [:edit,:new,:create,:update,:destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  ##### FB LOGIN

  match 'auth/:provider/callback', to: 'sessions#facebook_create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  #get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :activities, only: [:new, :create, :edit, :update,:list,:destroy] do
    resources :reservations, only: [:new,:create] do
      get '/complete' => 'reservations#complete'
    end
  end

  resources :reviews , :only => [:create]

  resources :users,only: [:create,:edit,:new,:update] do
    resources :wishlists , only:[]  do
      get '/create' => 'wishlists#create'
      delete '/delete' =>'wishlists#destroy' , :as => 'delete_wishlist'
    end
  end

  ##### Front Pages Route
  # get '/activities/:cityname' => 'front_pages#cities_search', :as => 'activities_like_search'
  # get '/activities' => 'front_pages#activities_list'
  # get '/activity/:id' => 'front_pages#activities_details', :as => 'activity_show'

  get '/meditation/classes/:cityname' => 'front_pages#cities_search', :as => 'activities_like_search'
  get '/meditation/classes' => 'front_pages#activities_list' , :as => 'activities_list'
  get '/meditation/class/:id' => 'front_pages#activities_details', :as => 'activity_show'

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
  get '/meditation/cities' => 'front_pages#cities_search', :as => 'activities_search'

  ##### Front Pages Route

  get '/google25bcf05f4f8ab6d5.html',
        :to => proc { |env| [200, {}, ["google-site-verification: google25bcf05f4f8ab6d5.html"]] }

end
