# frozen_string_literal: true

# Visit
class Visit < ApplicationRecord
  %i[patient_id agency_id user_id visit_type_id time_in time_out].each do |attr|
    validates_presence_of attr.to_sym
  end

  validates_presence_of :note, presence: true, allow_nil: true

  belongs_to :patient
  belongs_to :agency
  belongs_to :user
  belongs_to :visit_type
end
