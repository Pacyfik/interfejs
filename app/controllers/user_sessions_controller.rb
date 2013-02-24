#encoding: utf-8
class UserSessionsController < ApplicationController
  before_filter :authenticate, :only => [:destroy]
  
  def new
    @user_session = UserSession.new
  end
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_url, notice: "Zalogowano pomyślnie (użytkownik "+@user_session.login+")."
    else
      render :action => 'new', notice: 'Wystąpił błąd podczas logowania. Spróbuj ponownie.'
    end
  end
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to root_url, notice: 'Wylogowano pomyślnie.'
  end
end
