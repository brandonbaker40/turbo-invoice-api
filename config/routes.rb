# frozen_string_literal: true

Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, :disciplines, :agencies, :visit_types, :visits, :clearances, :contracts, :agency_rates, :patients, :rates
    end
  end
end
