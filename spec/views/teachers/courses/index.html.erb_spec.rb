require 'rails_helper'

RSpec.describe 'teachers/courses/index', type: :view do
  before(:each) do
    assign(:teachers_courses, [
             Teachers::Course.create!,
             Teachers::Course.create!
           ])
  end

  it 'renders a list of teachers/courses' do
    render
  end
end
