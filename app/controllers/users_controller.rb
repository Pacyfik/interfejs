﻿#encoding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :destroy]
  before_filter :admin_required, :only => [:index, :show]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user #User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: 'Utworzono nowe konto użytkownika.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new", notice: 'Nie utworzono nowego konta użytkownika.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = current_user #User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to profil_path, notice: 'Zaktualizowano dane użytkownika.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'Nie zaktualizowano danych użytkownika.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = current_user #User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Usunięto konto użytkownika.' }
      format.json { head :no_content }
    end
  end
end
