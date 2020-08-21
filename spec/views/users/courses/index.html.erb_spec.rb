require 'rails_helper'

RSpec.describe 'users/courses/index', type: :view do
  before(:each) do
    assign(:courses, [
             Course.create!,
             Course.create!
           ])
  end

  it 'renders a list of users/courses' do
    render
  end
end
