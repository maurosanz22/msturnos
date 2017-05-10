Rails.application.routes.draw do
  resources :branches do
    get "index/:company_id" => "branches#index", :as => "company"
  end 
  resources :companies
  resources :areas
  get 'portal/index' => 'portal#index', :as => 'portal'
  get 'admin/index' => 'admin#index', :as => 'admin'
  get 'super_admin/index' => 'super_admin#index', :as => 'super_admin'
  get 'super_admin/new_admin' => 'super_admin#new_admin', :as => 'new_admin'

  devise_for :users, :controllers => {:registrations => "registrations"}

  root 'home#index'
end
