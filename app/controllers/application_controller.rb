class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin?
    if current_user.try(:admin?)
      true
    else
      redirect_to :root
    end
  end
end
