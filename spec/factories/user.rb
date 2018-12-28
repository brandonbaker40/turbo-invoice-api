# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    nickname { Faker::Name.last_name }
    image { nil }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    tokens { {} }
  end
end
