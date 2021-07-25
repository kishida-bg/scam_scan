Rails.application.routes.draw do
  root 'accounts#search'
  resources :accounts
end
