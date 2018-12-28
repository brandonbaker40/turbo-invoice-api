# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rate, type: :model do
  let(:r) { build(:rate) }

  describe 'ActiveModel validations' do
    # basic validations
    %i[user_id visit_type_id agency_id amount arrangement].each do |attr|
      it { expect(r).to validate_presence_of(attr) }
    end

    it { expect(r.amount).to be_a(Float) }
    it { expect(r).to define_enum_for(:arrangement).with_values(%i[visit hour quarter_hour half_hour mile]) }
  end

  describe 'ActiveRecord associations' do
    it { expect(r).to belong_to(:user) }
    it { expect(r).to belong_to(:visit_type) }
    it { expect(r).to belong_to(:agency) }
  end
end
