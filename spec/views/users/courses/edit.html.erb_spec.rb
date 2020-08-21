require 'rails_helper'

RSpec.describe "users/courses/edit", type: :view do
  before(:each) do
    @course = assign(:users_course, Course.create!())
  end

  it "renders the edit users_course form" do
    render

    assert_select "form[action=?][method=?]", users_course_path(@course), "post" do
    end
  end
end
