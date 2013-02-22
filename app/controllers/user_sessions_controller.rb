﻿#encoding: utf-8
class UserSessionsController < ApplicationController
  before_filter :authenticate, :only => [:destroy]
  
  def new
    @user_session = UserSession.new
  end
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Zalogowano pomyślnie (użytkownik "+@user_session.login+")."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Wylogowano pomyślnie."
    redirect_to root_url
  end
end
