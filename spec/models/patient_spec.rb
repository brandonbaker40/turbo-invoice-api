# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Patient, type: :model do
  let(:pt) { build(:patient) }

  describe 'ActiveModel validations' do
    # basic validations
    %i[first_name last_name sex date_of_birth].each do |attr|
      it { expect(pt).to validate_presence_of(attr) }
    end

    it { expect(pt).to_not allow_value(nil).for(:agency_id) }
    it { expect(pt).to define_enum_for(:sex).with_values(%i[male female]) }
  end

  describe 'ActiveRecord associations' do
    it { expect(pt).to have_many(:visits) }
    it { expect(pt).to have_many(:users).through(:visits) }
    it { expect(pt).to belong_to(:agency) }
  end
end
