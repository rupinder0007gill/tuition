require 'rails_helper'

RSpec.describe 'users/enrollments/edit', type: :view do
  before(:each) do
    @users_enrollment = assign(:users_enrollment, Users::Enrollment.create!)
  end

  it 'renders the edit users_enrollment form' do
    render

    assert_select 'form[action=?][method=?]', users_enrollment_path(@users_enrollment), 'post' do
    end
  end
end
