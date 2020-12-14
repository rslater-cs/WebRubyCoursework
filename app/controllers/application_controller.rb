class ApplicationController < ActionController::Base

  def active_user
    User.find_by(id: session[:user_id])
  end

  def logged_in
    !active_user.nil?
  end
end
