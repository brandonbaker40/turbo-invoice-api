# frozen_string_literal: true

Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'

  scope '/api/v1' do
    resources :users, except: [:new, :create]
    resources :disciplines, :agencies, :visit_types, :visits

    # If available, these routes should only be available to admins
    resources :clearances, :contracts, :agency_rates, :patients, :rates, :users

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
end
