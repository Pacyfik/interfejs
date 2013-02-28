#encoding: utf-8
class TagsController < ApplicationController
  before_filter :authenticate

  # GET /tags
  # GET /tags.json
  def index

 	if params[:order]
	  if params[:order] == "asc"
        @tags = current_user.tags.order("name ASC")
	  elsif params[:order] == "desc"
	    @tags = current_user.tags.order("name DESC")
	  else
	    @tags = current_user.tags.all
	  end
	else
	  @tags = current_user.tags.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tags }
    end
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = current_user.tags.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /tags/new
  # GET /tags/new.json
  def new
    @tag = Tag.new
#	@tag.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /tags/1/edit
  def edit
    @tag = current_user.tags.find(params[:id])
	@statuses = current_user.statuses.all
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(params[:tag])
	@tag.user_id = current_user.id

    respond_to do |format|
      if @tag.save
        format.html { redirect_to etykiety_path, notice: 'Utworzono etykietę.' }
        format.json { render json: tags_path, status: :created, location: @tag }
      else
        format.html { render action: "new", notice: 'Nie utworzono etykiety.' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.json
  def update
    params[:tag][:status_ids] ||= []
    @tag = current_user.tags.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to etykiety_path, notice: 'Zmodyfikowano etykietę.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'Nie zmodyfikowano etykiety.' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag = current_user.tags.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to etykiety_path, notice: 'Usunięto etykietę.' }
      format.json { head :no_content }
    end
  end
end
