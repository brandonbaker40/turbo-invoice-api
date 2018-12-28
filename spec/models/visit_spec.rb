# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Visit, type: :model do
  let(:v) { build(:visit) }

  describe 'ActiveModel validations' do
    # basic validations
    %i[patient_id agency_id user_id visit_type_id time_in time_out].each do |attr|
      it { expect(v).to validate_presence_of(attr) }
    end

    it { expect(v).to allow_value(nil).for(:note) }
  end

  describe 'ActiveRecord associations' do
    it { expect(v).to belong_to(:patient) }
    it { expect(v).to belong_to(:agency) }
    it { expect(v).to belong_to(:user) }
    it { expect(v).to belong_to(:visit_type) }
  end
end
