#encoding: utf-8
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



  # search
	
  def search
	require 'rubygems'
	require 'rest_client'
	require 'json'
	  
	title2find=params[:search]
	if title2find.include? ' '
	  title2find= title2find.gsub!(' ', '+')
	end
	 
	headers  = {:accept => "application/json"}
    response = RestClient.get "http://api.themoviedb.org/3/search/movie?api_key=8f8bdc43aaf51d09127c3eb023007a53&query=#{title2find}", headers 	
    parsed_json = JSON.parse(response) 

	unless parsed_json["results"].empty?
		num = parsed_json.size - 1
		titles=[]
		for i in 0..num
		  titles[i] = [ parsed_json["results"][i]["original_title"].to_s , parsed_json["results"][i]["release_date"].to_s , parsed_json["results"][i]["id"].to_s ]
		end
	else
	 	redirect_to "/movies/new", :notice => 'Nie znaleziono dopasowania'
	end
 
 	@searchb = titles
	  
  end


  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.json
  def create
  
  
	require 'rubygems'
	require 'rest_client'
	require 'json'
		
  	m_id=params[:m_id]	

	headers  = {:accept => "application/json"}
    response = RestClient.get "http://api.themoviedb.org/3/movie/#{m_id}?api_key=8f8bdc43aaf51d09127c3eb023007a53", headers 	
	parsed_json = JSON.parse(response)
	  
    movie_act = Movie.new
	movie_act.title = parsed_json["original_title"].to_s
 	movie_act.year = parsed_json["release_date"].to_s
	movie_act.country = parsed_json["production_countries"].to_s
	movie_act.genre = parsed_json["genres"].to_s
    movie_act.overview = parsed_json["overview"].to_s
    movie_act.poster_path = parsed_json["poster_path"].to_s
	movie_act.id2 = parsed_json["id"].to_s

  	@mid = m_id
    @movie = movie_act

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
