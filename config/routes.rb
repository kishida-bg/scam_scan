# frozen_string_literal: true

Rails.application.routes.draw do
  root 'accounts#index'
  resources :accounts
  resources :comments
end
