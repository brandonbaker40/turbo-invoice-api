# frozen_string_literal: true

# VisitType
class VisitType < ApplicationRecord
  %i[name].each do |attr|
    validates_presence_of attr.to_sym
  end

  validates_presence_of :code, presence: true, allow_nil: true

  has_many :visits
  has_many :agency_rates
  has_many :agencies, through: :agency_rates
  has_many :rates
  has_many :users, through: :rates
end
