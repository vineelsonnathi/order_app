class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found

  protected

  def record_not_found
    session[:total_amount] = nil
    redirect_to step1_steps_path
  end
end
