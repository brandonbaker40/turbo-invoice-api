# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AgencyRate, type: :model do
  let(:ar) { build(:rate) }

  describe 'ActiveModel validations' do
    # basic validations
    %i[user_id visit_type_id agency_id amount arrangement].each do |attr|
      it { expect(ar).to validate_presence_of(attr) }
    end

    it { expect(ar.amount).to be_a(Float) }
    it { expect(ar).to define_enum_for(:arrangement).with_values(%i[visit hour quarter_hour half_hour mile]) }
  end

  describe 'ActiveRecord associations' do
    it { expect(ar).to belong_to(:visit_type) }
    it { expect(ar).to belong_to(:agency) }
  end
end
