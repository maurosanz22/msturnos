Rails.application.routes.draw do
  resources :companies
  resources :areas
  get 'portal/index' => 'portal#index', :as => 'portal'
  get 'admin/index' => 'admin#index', :as => 'admin'
  get 'super_admin/index' => 'super_admin#index', :as => 'super_admin'
  get 'super_admin/new_admin' => 'super_admin#new_admin', :as => 'new_admin'

  devise_for :users, :controllers => {:registrations => "registrations"}
  #devise_for :users, 
  #           controllers: {
  #             registrations: "devise/registrations", 
  #             sessions: "devise/sessions", 
  #             passwords: "devise/passwords", 
  #             confirmations: "devise/confirmations"}
  #devise_for :users
  #devise_for :users,
  #           :controllers => { :registrations => "users/registrations",
  #                             :confirmations => "users/confirmations",
  #                             :sessions => 'devise/sessions'},
  #           :skip => [:sessions] do
  #  get '/signin'   => "devise/sessions#new",       :as => :signin
  #  post '/signin'  => 'devise/sessions#create',    :as => :user_session
  #  get '/signout'  => 'devise/sessions#destroy',   :as => :destroy_user_session
  #  get "/signup"   => "users/registrations#new",   :as => :new_user_registration
  #end

  root 'home#index'
end
