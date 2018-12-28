# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    nickname { Faker::Name.last_name }
    image { nil }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    tokens { {} }
    discipline
    street_address { Faker::Address.street_address }
    city { Faker::Address.community }
    state { Faker::Address.state_abbr }
    zip_code { rand.to_s[2..6] }
  end
end
