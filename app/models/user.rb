# frozen_string_literal: true

# User
class User < ApplicationRecord
  def self.from_token_payload(payload)
    find_or_create_by(
      email: payload['email'],
      auth0_id_string: payload['sub']
    )
  end

  # rubocop:disable Metrics/LineLength
  %i[email discipline_id street_address city state zip_code auth0_id_string].each do |attr|
    validates_presence_of attr.to_sym
  end
  # rubocop:enable Metrics/LineLength

  validates :zip_code, numericality: true
  validates :state, length: { is: 2 }

  validates_format_of :zip_code, with: /\A\d{5}\z/

  # rubocop:disable Metrics/LineLength
  validates_format_of :state, with: /\A(?-i:A[LKZR]|C[AOT]|D[EC]|F[L]|G[A]|HI|I[ADLN]|K[SY]|LA|M[ADEINOST]|N[CDEHJMVY]|O[HKR]|PA|RI|S[CD]|T[NX]|UT|V[AT]|W[AIVY])\z/
  # rubocop:enable Metrics/LineLength

  belongs_to :discipline
  has_many :visits
  has_many :patients, through: :visits
  has_many :rates
  has_many :clearances
  has_many :agencies, through: :clearances
end
