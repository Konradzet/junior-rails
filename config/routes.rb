# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  resources :posts
  devise_for :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/posts', to: 'posts#index'
  
end
