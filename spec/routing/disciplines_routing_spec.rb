# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DisciplinesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/disciplines').to route_to('disciplines#index')
    end

    it 'routes to #show' do
      expect(get: '/disciplines/1').to route_to('disciplines#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/disciplines').to route_to('disciplines#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/disciplines/1').to route_to('disciplines#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/disciplines/1').to route_to('disciplines#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/disciplines/1').to route_to('disciplines#destroy', id: '1')
    end
  end
end
