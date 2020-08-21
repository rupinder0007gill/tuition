require 'rails_helper'

RSpec.describe 'teachers/courses/new', type: :view do
  before(:each) do
    assign(:teachers_course, Teachers::Course.new)
  end

  it 'renders new teachers_course form' do
    render

    assert_select 'form[action=?][method=?]', teachers_courses_path, 'post' do
    end
  end
end
