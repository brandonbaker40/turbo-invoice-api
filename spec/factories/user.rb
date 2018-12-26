# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Timothy' }
    nickname { 'Timmy' }
    image { nil }
    email { 'tim@example.com' }
    password { 'password1' }
    tokens { {} }
  end
end
