#encoding: utf-8
class StatusesController < ApplicationController
  before_filter :authenticate

  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = current_user.statuses.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statuses }
    end
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
    @status = current_user.statuses.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status }
    end
  end

  # GET /statuses/new
  # GET /statuses/new.json
  def new
    @status = Status.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @status }
    end
  end

  # GET /statuses/1/edit
  def edit
    @status = current_user.statuses.find(params[:id])
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(params[:status])
	@status.user_id = current_user.id
	
    respond_to do |format|
      if @status.save
        format.html { redirect_to statuses_path, notice: 'Dodano nowy film do listy.' }
        format.json { render json: statuses_path, status: :created, location: @status }
      else
        format.html { render action: "new", notice: 'Nie dodano nowego filmu do listy.'  }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statuses/1
  # PUT /statuses/1.json
  def update
    @status = current_user.statuses.find(params[:id])

    respond_to do |format|
      if @status.update_attributes(params[:status])
        format.html { redirect_to statuses_path, notice: 'Zmodyfikowano dane o filmie.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'Nie zmodyfikowano danych o filmie.'  }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status = current_user.statuses.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to statuses_url, notice: 'Usunięto film z listy.' }
      format.json { head :no_content }
    end
  end
end
