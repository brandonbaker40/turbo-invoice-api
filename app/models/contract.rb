# frozen_string_literal: true

# Contract
class Contract < ApplicationRecord
  %i[agency_id effective_date].each do |attr|
    validates_presence_of attr.to_sym
  end

  validates :termination_date, presence: true, allow_nil: true

  belongs_to :agency
end
