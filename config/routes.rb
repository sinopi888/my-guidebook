Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  resources :guidebook, only: [:index]
  devise_for :users, controllers: {:registrations => 'users/registrations'}
  # devise_scope :user do
  #   get 'users/sign_up', to: 'users/registrations#new'
  #   # get 'users/log_out', to: 'users/sessions#log_out'
  #   # get 'users/sms_auth', to: 'users/registrations#sms_auth'
  #   # get 'users/address', to: 'users/registrations#address'
  #   # get 'users/payment', to: 'users/registrations#payment'
  #   # get 'users/registered', to: 'users/registrations#registered'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

