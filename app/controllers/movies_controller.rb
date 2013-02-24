﻿#encoding: utf-8
class MoviesController < ApplicationController
  before_filter :authenticate, :only => [:new, :create]
  before_filter :admin_required, :only => [:index, :show, :destroy, :edit, :update]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movies }
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.json
  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: '???Dodano nowy film do bazy danych???' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new", notice: '???Nie dodano nowego filmu do bazy danych???' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to @movie, notice: '???Zmodyfikowano dane o filmie w bazie danych.???' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: '???Nie zmodyfikowano danych o filmie w bazie danych.???' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: '???Usunięto film z bazy danych.???' }
      format.json { head :no_content }
    end
  end
end
