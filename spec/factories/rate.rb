# frozen_string_literal: true

FactoryBot.define do
  factory :rate do
    user
    visit_type
    agency
    amount { rand(75.00...125.50) }
    arrangement { [0, 1, 2, 3, 4].sample }
  end
end
