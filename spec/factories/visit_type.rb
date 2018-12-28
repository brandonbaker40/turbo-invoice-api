# frozen_string_literal: true

FactoryBot.define do
  factory :visit_type do
    name { %w[Admission Evaluation].sample }
    code { rand.to_s[2..6] }
  end
end
