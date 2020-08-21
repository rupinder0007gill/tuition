require 'rails_helper'

RSpec.describe 'teachers/courses/show', type: :view do
  before(:each) do
    @teachers_course = assign(:teachers_course, Teachers::Course.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
