# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:u) { build(:user) }

  describe 'ActiveModel validations' do
    # basic validations
    %i[email discipline_id street_address city state zip_code].each do |attr|
      it { expect(u).to validate_presence_of(attr) }
    end
  end

  describe 'ActiveRecord associations' do
    it { expect(u).to belong_to(:discipline) }
    it { expect(u).to have_many(:visits) }
    it { expect(u).to have_many(:patients).through(:visits) }
    it { expect(u).to have_many(:rates) }
    it { expect(u).to have_many(:clearances) }
    it { expect(u).to have_many(:agencies).through(:clearances) }
  end
end
