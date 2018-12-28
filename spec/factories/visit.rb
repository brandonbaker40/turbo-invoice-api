# frozen_string_literal: true

FactoryBot.define do
  factory :visit do
    patient
    agency
    user
    visit_type
    time_in { '2018-12-28 13:03:13' }
    time_out { '2018-12-28 13:03:14' }
    note { 'Patient is ill.' }
  end
end
