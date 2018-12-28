# frozen_string_literal: true

# Clearance
class Clearance < ApplicationRecord
  %i[user_id agency_id].each do |attr|
    validates_presence_of attr.to_sym
  end

  belongs_to :user
  belongs_to :agency
end
