# frozen_string_literal: true

require 'rails_helper'

valid_klasses = []
ActiveRecord::Base.connection.tables.map do |model|
  klass = model.capitalize.singularize.camelize
  klass.safe_constantize.class != NilClass ? valid_klasses.push(klass.safe_constantize) : nil
end

valid_klasses.each do |model|
  RSpec.describe model, type: :model do
    it 'has a valid factory' do
      expect(build(model.name.underscore.to_sym)).to be_valid
    end

    let(:some_model_instance) { build(model.name.underscore.to_sym) }

    describe 'ActiveModel validations' do
      if model.has_attribute? :state
        it { expect(some_model_instance).to allow_value('AZ').for(:state) }

        it { expect(some_model_instance).to_not allow_value('PR').for(:state) }
        it { expect(some_model_instance).to_not allow_value('WVa').for(:state) }
        it { expect(some_model_instance).to_not allow_value('md').for(:state) }
        it { expect(some_model_instance).to_not allow_value('Arizona').for(:state) }

        it { expect(some_model_instance).to validate_length_of(:state).is_equal_to(2) }

      end

      if model.has_attribute? :zip_code
        it { expect(some_model_instance).to allow_value('20871').for(:zip_code) }

        it { expect(some_model_instance).to_not allow_value('2087-1').for(:zip_code) }
        it { expect(some_model_instance).to_not allow_value('20871-2324').for(:zip_code) }

        it { expect(some_model_instance).to validate_numericality_of(:zip_code) }
      end

      if model.has_attribute? :phone_number
        it { expect(some_model_instance).to allow_value('3015555555').for(:phone_number) }

        it { expect(some_model_instance).to_not allow_value('301-555-5555').for(:phone_number) }
        it { expect(some_model_instance).to_not allow_value('(301)555-5555').for(:phone_number) }
        it { expect(some_model_instance).to_not allow_value('301.555.5555').for(:phone_number) }
        it { expect(some_model_instance).to_not allow_value('301555555').for(:phone_number) }

        it { expect(some_model_instance).to validate_numericality_of(:phone_number) }
      end
    end
  end
end
