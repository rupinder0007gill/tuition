require 'rails_helper'

RSpec.describe 'teachers/courses/edit', type: :view do
  before(:each) do
    @teachers_course = assign(:teachers_course, Teachers::Course.create!)
  end

  it 'renders the edit teachers_course form' do
    render

    assert_select 'form[action=?][method=?]', teachers_course_path(@teachers_course), 'post' do
    end
  end
end
