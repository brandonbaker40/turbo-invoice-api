# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contract, type: :model do
  let(:c) { build(:contract) }

  describe 'ActiveModel validations' do
    %i[agency_id effective_date].each do |attr|
      it { expect(c).to validate_presence_of(attr) }
    end

    it { expect(c).to_not allow_value(nil).for(:agency_id) }
    it { expect(c).to allow_value(nil).for(:termination_date) }
  end

  describe 'ActiveRecord associations' do
    it { expect(c).to belong_to(:agency) }
  end
end
