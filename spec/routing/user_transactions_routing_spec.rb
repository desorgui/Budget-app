require 'rails_helper'

RSpec.describe UserTransactionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/user_transactions').to route_to('user_transactions#index')
    end

    it 'routes to #new' do
      expect(get: '/user_transactions/new').to route_to('user_transactions#new')
    end

    it 'routes to #show' do
      expect(get: '/user_transactions/1').to route_to('user_transactions#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/user_transactions/1/edit').to route_to('user_transactions#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/user_transactions').to route_to('user_transactions#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/user_transactions/1').to route_to('user_transactions#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/user_transactions/1').to route_to('user_transactions#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/user_transactions/1').to route_to('user_transactions#destroy', id: '1')
    end
  end
end
