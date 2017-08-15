Rails.application.routes.draw do
  
  resources :shifts
  resources :management_shifts
  resources :shift_types
  resources :activities
  resources :branches
  resources :companies
  resources :areas
  
  get 'portal/index' => 'portal#index', :as => 'portal'
  get 'portal/search_company' => 'portal#search_company', :as => 'search_company'
  get 'portal/follow_company/:company_id' => 'portal#follow_company', :as => 'follow_company'

  get 'admin/index' => 'admin#index', :as => 'admin'

  get 'super_admin/index' => 'super_admin#index', :as => 'super_admin'
  get 'super_admin/new_admin' => 'super_admin#new_admin', :as => 'new_admin'
  
  post 'branches/show' => 'branches#create_activity', :as => 'create_activity_branch'


  devise_for :users, :controllers => {:registrations => "registrations"}

  root 'home#index'
end
