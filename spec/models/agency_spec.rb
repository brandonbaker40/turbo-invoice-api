# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Agency, type: :model do
  let(:a) { build(:agency) }

  describe "ActiveModel validations" do
    [:name, :phone, :street_address, :city, :state, :zip_code].each do |attr|
      it { expect(a).to validate_presence_of(attr) }
    end

    it { expect(a).to validate_length_of(:name).is_at_least(1).is_at_most(50)}
    it { expect(a).to validate_uniqueness_of(:name) }
  end

  describe "ActiveRecord associations" do
    it {expect(a).to have_many(:patients) }
    it {expect(a).to has_one(:contract) }
    it {expect(a).to have_many(:visits).through(:patients) }
  end
end
