# frozen_string_literal: true

FactoryBot.define do
  factory :discipline do
    name { 'Physical Therapy' }
    field { 'Physical Therapy Assistance' }
    job_title { 'Physical Therapist Assistant' }
    abbreviation { 'PTA' }
  end
end
