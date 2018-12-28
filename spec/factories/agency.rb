# frozen_string_literal: true

FactoryBot.define do
  factory :agency do
    name { Faker::Company.name }
    phone { 3015551234 }
    street_address { Faker::Address.street_address }
    city { Faker::Address.community }
    state { Faker::Address.state_abbr }
    zip_code { 20871 }
    approved { true }
  end
end
