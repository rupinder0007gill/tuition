require 'rails_helper'

RSpec.describe 'users/enrollments/new', type: :view do
  before(:each) do
    assign(:users_enrollment, Users::Enrollment.new)
  end

  it 'renders new users_enrollment form' do
    render

    assert_select 'form[action=?][method=?]', users_enrollments_path, 'post' do
    end
  end
end
