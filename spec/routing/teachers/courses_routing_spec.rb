require 'rails_helper'

RSpec.describe Teachers::CoursesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/teachers/courses').to route_to('teachers/courses#index')
    end

    it 'routes to #new' do
      expect(get: '/teachers/courses/new').to route_to('teachers/courses#new')
    end

    it 'routes to #show' do
      expect(get: '/teachers/courses/1').to route_to('teachers/courses#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/teachers/courses/1/edit').to route_to('teachers/courses#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/teachers/courses').to route_to('teachers/courses#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/teachers/courses/1').to route_to('teachers/courses#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/teachers/courses/1').to route_to('teachers/courses#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/teachers/courses/1').to route_to('teachers/courses#destroy', id: '1')
    end
  end
end
