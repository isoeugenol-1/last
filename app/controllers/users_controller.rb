class UsersController < ApplicationController
  include ApplicationHelper
  before_action :set_user, only: [:show, :edit, :update]
  @@admin_check = false
  def index
    if logged_in?
      redirect_to homes_path
    else
      @user = User.new
      if params[:ad].present?
        @@admin_check = true
      else
        @@admin_check = false
      end
    end
  end
  
  def create
    @user = User.new(user_params)
    if @@admin_check.present?
      @user.admin = true
    end
    
    if @user.save
      redirect_to new_session_path
    else
      render 'index'
    end
  end
  
  def edit
  end
  
  def show
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Feed was successfully updated.'
    else
      render 'show'
    end
  end
  
  private
  
  def set_user
    @user = current_user
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end

