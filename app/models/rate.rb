# frozen_string_literal: true

# Rate
class Rate < ApplicationRecord
  %i[user_id visit_type_id amount arrangement].each do |attr|
    validates_presence_of attr.to_sym
  end

  validates :amount, presence: true, numericality: { only_float: true }

  enum arrangement: %i[visit hour quarter_hour half_hour mile]

  belongs_to :user
  belongs_to :visit_type
  belongs_to :agency, optional: true
end
