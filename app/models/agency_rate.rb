# frozen_string_literal: true

# AgencyRate
class AgencyRate < ApplicationRecord
  %i[visit_type_id agency_id amount arrangement].each do |attr|
    validates_presence_of attr.to_sym
  end

  validates :amount, presence: true, numericality: { only_float: true }

  enum arrangement: %i[visit hour quarter_hour half_hour mile]

  belongs_to :agency
  belongs_to :visit_type
end
