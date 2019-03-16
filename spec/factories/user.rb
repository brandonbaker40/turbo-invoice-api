# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    discipline
    email { Faker::Internet.email }
    street_address { Faker::Address.street_address }
    city { Faker::Address.community }
    state { Faker::Address.state_abbr }
    zip_code { rand.to_s[2..6] }
  end
end
