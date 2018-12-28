# frozen_string_literal: true

FactoryBot.define do
  factory :contract do
    agency
    effective_date { '2017-12-28' }
    termination_date { '2018-12-28' }
  end
end
