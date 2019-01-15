# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Agency, type: :model do
  let(:a) { build(:agency) }

  describe 'ActiveModel validations' do
    # basic validations
    %i[name phone street_address city state zip_code].each do |attr|
      it { expect(a).to validate_presence_of(attr) }
    end

    it { expect(a).to validate_length_of(:name).is_at_least(1).is_at_most(50) }
    it { expect(a).to validate_uniqueness_of(:name) }
  end

  describe 'ActiveRecord associations' do
    it { expect(a).to have_many(:patients) }
    it { expect(a).to have_many(:patients).through(:visits) }
    it { expect(a).to have_one(:contract) }
    it { expect(a).to have_many(:clearances) }
    it { expect(a).to have_many(:users).through(:clearances) }
    it { expect(a).to have_many(:visits) }
    it { expect(a).to have_many(:agency_rates) }
    it { expect(a).to have_many(:visit_types).through(:agency_rates) }
    it { expect(a).to have_many(:rates) }
  end
end
