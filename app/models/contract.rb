# frozen_string_literal: true

# Contract
class Contract < ApplicationRecord
  %i[agency_id effective_date termination_date].each do |attr|
    validates_presence_of attr.to_sym
  end

  belongs_to :agency
end
