class Users::UserController < ApplicationController
  before_action :authenticate_user!, :set_paper_trail_whodunnit

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, notice: 'Access denied. You are not authorized to access the requested page.'
  end

  protected

  def user_for_paper_trail
    current_user.id
  end
end
