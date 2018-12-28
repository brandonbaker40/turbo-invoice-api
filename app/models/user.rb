# frozen_string_literal: true

# User
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable

  include DeviseTokenAuth::Concerns::User

  # rubocop:disable Metrics/LineLength
  %i[name nickname email password discipline_id street_address city state zip_code].each do |attr|
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
end
