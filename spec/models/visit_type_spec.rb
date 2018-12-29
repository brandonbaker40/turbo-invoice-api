# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VisitType, type: :model do
  let(:vt) { build(:visit_type) }

  describe 'ActiveModel validations' do
    # basic validations
    %i[name].each do |attr|
      it { expect(vt).to validate_presence_of(attr) }
    end

    it { expect(vt).to allow_value(nil).for(:code) }
  end

  describe 'ActiveRecord associations' do
    it { expect(vt).to have_many(:visits) }
    it { expect(vt).to have_many(:agency_rates) }
    it { expect(vt).to have_many(:agencies).through(:agency_rates) }
    it { expect(vt).to have_many(:rates) }
    it { expect(vt).to have_many(:users).through(:rates) }
  end
end
