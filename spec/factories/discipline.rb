# frozen_string_literal: true

FactoryBot.define do
  factory :discipline do
    name { Faker::Games::Pokemon.name }
    field { Faker::Games::Pokemon.location }
    job_title { Faker::Games::Pokemon.move }
    abbreviation { Faker::Address.state_abbr }
  end
end
