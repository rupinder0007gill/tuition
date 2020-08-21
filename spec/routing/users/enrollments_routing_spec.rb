require 'rails_helper'

RSpec.describe Users::EnrollmentsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users/enrollments').to route_to('users/enrollments#index')
    end

    it 'routes to #new' do
      expect(get: '/users/enrollments/new').to route_to('users/enrollments#new')
    end

    it 'routes to #show' do
      expect(get: '/users/enrollments/1').to route_to('users/enrollments#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/users/enrollments/1/edit').to route_to('users/enrollments#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users/enrollments').to route_to('users/enrollments#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/enrollments/1').to route_to('users/enrollments#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/enrollments/1').to route_to('users/enrollments#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/enrollments/1').to route_to('users/enrollments#destroy', id: '1')
    end
  end
end
