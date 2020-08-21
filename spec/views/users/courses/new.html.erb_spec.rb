require 'rails_helper'

RSpec.describe 'users/courses/new', type: :view do
  before(:each) do
    assign(:course, Course.new)
  end

  it 'renders new users_course form' do
    render

    assert_select 'form[action=?][method=?]', users_courses_path, 'post' do
    end
  end
end
