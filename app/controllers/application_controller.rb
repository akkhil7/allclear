class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #
  before_action :authenticate

  def current_user
    User.where(:id => 5).first
  end

  protected
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(access_token: token)
    end
  end

end
