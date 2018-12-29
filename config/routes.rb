# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :users, except: [:new, :create]
  resources :disciplines, :agencies, :visit_types, :visits

  resources :agencies do
    resources :patients, only: [:index, :new, :create, :show]
    resources :rates
    resources :agency_rates
    resources :visits
    resources :contract
    resources :clearances
  end

  resources :patients do
    resources :visits
  end

  resources :users do
    resources :visits
    resources :rates
    resources :clearances
  end

  resources :visit_types do
    resources :visits
    resources :rates
  end

  resources :disciplines do
    resources :users, only: [:index, :show]
  end
end
