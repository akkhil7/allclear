class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :cors_set_access_control_headers

  def current_user
    User.where(:id => 5).first
  end

end
