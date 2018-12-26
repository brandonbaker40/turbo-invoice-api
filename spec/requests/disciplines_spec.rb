# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Disciplines', type: :request do
  describe 'GET /disciplines' do
    it 'works! (now write some real specs)' do
      get disciplines_path
      expect(response).to have_http_status(200)
    end
  end
end
