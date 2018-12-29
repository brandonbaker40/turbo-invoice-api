# frozen_string_literal: true

FactoryBot.define do
  factory :agency_rate do
    agency
    visit_type
    amount { rand(125.50...170.25) }
    arrangement { [0, 1, 2, 3, 4].sample }
  end
end
