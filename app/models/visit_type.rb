# frozen_string_literal: true

# VisitType
class VisitType < ApplicationRecord
  %i[name].each do |attr|
    validates_presence_of attr.to_sym
  end

  validates_presence_of :code, presence: true, allow_nil: true

  has_many :visits
end
