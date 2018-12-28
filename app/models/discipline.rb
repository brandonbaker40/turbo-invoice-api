# frozen_string_literal: true

# Discipline
class Discipline < ApplicationRecord
  %i[name field job_title abbreviation].each do |attr|
    validates_presence_of attr.to_sym
  end

  %i[name job_title abbreviation].each do |attr|
    validates_uniqueness_of attr.to_sym
  end

  has_many :users
end
