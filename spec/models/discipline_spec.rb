# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Discipline, type: :model do
  let(:d) { build(:discipline) }

  it 'has a valid factory' do
    expect(build(:discipline)).to be_valid
  end
end
