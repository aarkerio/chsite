# Chipotle Software (c) 2013 GPLv3

#require 'debugger' 

class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_filter :layout_by_action

  before_filter :authenticate_user!

  helper_method :sort_column, :sort_direction

  # GET /users
  # GET /users.json
  def index
      order = sort_column + " " + sort_direction
      @users = User.paginate(:include => [:group], :page => params[:page], :per_page => 40).order(order)
  end

  # GET /users/1
  # GET /users/1.json
  def show

  end

  # GET /users/new
  def new
    @user   = User.new
    # logger.debug @themes
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def newuser
    # debugger
    self.class.layout "admin" 
         
    # logger.debug "I am here!!"     
    #return render :text => "The object is not settled"
    @user   = User.new
    @groups = Group.all
  end

    # POST /users
  # POST /users.json
  def nuevo
    # raise user_params.to_yaml
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /users
  # POST /users.json
  def create
    # raise user_params.to_yaml
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save!
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
        params.require(:user).permit(:fname, :lname, :uname, :email, :password, :created, :password_confirmation, :active, :group_id)
    end

    # Next two methods order columns on view
    def sort_column
       User.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "DESC"
    end
end
