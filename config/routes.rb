# frozen_string_literal: true
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api, defaults: {format: :json} do

    # USERS
    get 'users/exists' => 'users#exists'
    get 'users/me' => 'users#me'
    resources :users
    
    get 'public' => 'sample#public'
    get 'private' => 'sample#private'
  end
end
