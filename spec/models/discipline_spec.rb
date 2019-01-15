# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Discipline, type: :model do
  let(:d) { build(:discipline) }

  describe 'ActiveModel validations' do
    # basic validations
    %i[name field job_title abbreviation].each do |attr|
      it { expect(d).to validate_presence_of(attr) }
    end

    %i[name job_title abbreviation].each do |attr|
      it { expect(d).to validate_uniqueness_of(attr) }
    end
  end

  describe 'ActiveRecord associations' do
    it { expect(d).to have_many(:users) }
  end
end
