# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Clearance, type: :model do
  let(:c) { build(:clearance) }

  describe 'ActiveModel validations' do
    %i[user_id agency_id].each do |attr|
      it { expect(c).to validate_presence_of(attr) }
    end
  end

  describe 'ActiveRecord associations' do
    it { expect(c).to belong_to(:agency) }
    it { expect(c).to belong_to(:user) }
  end
end
