# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:u) { build(:user) }

  describe 'ActiveModel validations' do
    %i[name nickname email password discipline_id street_address city state zip_code].each do |attr|
      it { expect(u).to validate_presence_of(attr) }
    end
  end

  describe 'ActiveRecord associations' do
    it { expect(u).to belong_to(:discipline) }
  end
end
