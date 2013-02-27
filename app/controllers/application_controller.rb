#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  def authenticate
    if !current_user
      redirect_to new_user_session_path, notice: 'Musisz być zalogowany, aby to zrobić.'
    end
  end
  def admin_required
    if !current_user
      redirect_to new_user_session_path, notice: 'Musisz być zalogowany, aby to zrobić.'
    elsif !current_user.admin?
      redirect_to root_url, notice: 'Nie jesteś do tego uprawniony.'
    end
  end
  
  rescue_from RestClient::ResourceNotFound, :with => :redirect_missing
  
  def redirect_missing
    redirect_to "/movies/new", :notice => 'Nie znaleziono dopasowania'
  end
  
end
