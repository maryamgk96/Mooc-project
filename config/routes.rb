Rails.application.routes.draw do
  root 'courses#index'
  resources :lectures do
    member do
      put "like", to: "lectures#like"
      put "unlike", to: "lectures#unlike"
      get :spam
    end
  end
  resources :courses
  resources :comments
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
