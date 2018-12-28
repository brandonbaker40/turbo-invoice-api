# frozen_string_literal: true

# Patient
class Patient < ApplicationRecord
  %i[first_name last_name sex date_of_birth agency_id].each do |attr|
    validates_presence_of attr.to_sym
  end

  enum sex: %i[male female]

  belongs_to :agency
  has_many :visits
  # has_many :users, through: :visits
end
