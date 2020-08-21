require 'rails_helper'

RSpec.describe 'users/enrollments/index', type: :view do
  before(:each) do
    assign(:users_enrollments, [
             Users::Enrollment.create!,
             Users::Enrollment.create!
           ])
  end

  it 'renders a list of users/enrollments' do
    render
  end
end
