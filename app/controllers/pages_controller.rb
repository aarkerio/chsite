
# Chipotle Software (c) 2013 GPLv3

require 'byebug'

class PagesController < ApplicationController

  before_action :set_page, only: [:show, :edit, :update, :destroy]       #    callbacks

  before_filter :authenticate_user!, :except => [:certification, :about, :contact]

  helper_method :sort_column, :sort_direction
 
  # GET /pages
  # GET /pages.json
  def index
      order = sort_column + " " + sort_direction
      @pages = Page.paginate(:page => params[:page], :per_page => set_limit).order(order).includes(:section)
  end

  # GET /pages/view/1.
  def certification
     
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
       @sections = Section.where("id > 0").order("description ASC").limit(@limit) 
  end

  # GET /pages/new
  def new
     @page = Page.new
     @sections = Section.where("id > 0").order("description ASC").limit(@limit)
  end

  # GET /pages/1/edit
  def edit
      @sections = Section.where("id > 0").order("description ASC").limit(@limit)
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)
    @page.user_id = current_user.id 

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
      @page.destroy
      respond_to do |format|
          format.html { redirect_to pages_url }
          format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :body, :discution, :published, :visits, :tags, :rank, :cv, :editor, :user_id, :created, :section_id)
    end

    # Next two methods order columns on view
    def sort_column
       Page.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "DESC"
    end

    def set_limit
       @limit = 10
    end

end

