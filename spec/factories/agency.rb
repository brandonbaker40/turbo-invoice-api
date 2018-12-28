# frozen_string_literal: true

FactoryBot.define do
  factory :agency do
    name { Faker::Company.name }
    phone { rand.to_s[2..11] }
    street_address { Faker::Address.street_address }
    city { Faker::Address.community }
    state { Faker::Address.state_abbr }
    zip_code { rand.to_s[2..6] }
    approved { true }
  end
end
