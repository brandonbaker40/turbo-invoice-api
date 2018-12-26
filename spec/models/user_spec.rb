# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:u) { build(:user) }

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end
end
