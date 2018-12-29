# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sex { [0, 1].sample }
    date_of_birth { Faker::Date.between(100.years.ago, 18.years.ago) }
    agency
  end
end
