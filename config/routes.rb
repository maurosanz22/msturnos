Rails.application.routes.draw do
  resources :areas
  get 'portal/index' => 'portal#index', :as => 'portal'
  get 'admin/index' => 'admin#index', :as => 'admin'
  get 'super_admin/index' => 'super_admin#index', :as => 'super_admin'

  devise_for :users

  root 'home#index'
end
