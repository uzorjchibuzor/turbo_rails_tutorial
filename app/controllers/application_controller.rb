class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :authenticate_user!, unless: :devise_controller?

  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end
  helper_method :current_company
  
end
