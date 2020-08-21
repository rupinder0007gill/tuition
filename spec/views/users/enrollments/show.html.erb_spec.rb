require 'rails_helper'

RSpec.describe 'users/enrollments/show', type: :view do
  before(:each) do
    @users_enrollment = assign(:users_enrollment, Users::Enrollment.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
