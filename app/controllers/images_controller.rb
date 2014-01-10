# Chipotle Software 2013 (c) GPLv3

class ImagesController < ApplicationController

  before_action :set_image, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!

  # before_filter :layout_by_action

  helper_method :sort_column, :sort_direction 

  # GET /images
  # GET /images.json
  def index
      order = sort_column + " " + sort_direction
      @images = Image.paginate(:page => params[:page], :per_page => 30).where(:user_id => current_user.id).order(order)
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image }
      else
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:file, :user_id, :tags)
    end

    # Next two methods order columns on view
    def sort_column
        Image.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "DESC"
    end
end
