# frozen_string_literal: true

Rails.application.routes.draw do
  root 'accounts#search'
  resources :accounts
  resources :comments
end
