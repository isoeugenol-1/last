class HomesController < ApplicationController
  before_action :set_home, only: [:edit, :update, :destroy, :show]
  before_action :login_check, only: [:show, :edit, :new, :destroy, :update]
  before_action :current_check, only: [:destroy, :edit, :update]
  include ApplicationHelper
  def index
    @q = Home.search(params[:q])
    @home = @q.result
  end
  
  def new
    if params[:back]
      @home = Home.new(home_params)
    else
      @home = Home.new
    end
  end
  
  def create
    @home = Home.new(home_params)
    @home.user_id = current_user.id
    if @home.save
      redirect_to homes_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def show
    @favorite = current_user.favorites.find_by(home_id: @home.id)
  end
  
  def destroy
    @home.destroy
    redirect_to homes_path
  end
  
  def update
    if @home.update(home_params)
      redirect_to homes_path
    else
      render 'edit'
    end
  end
  
  def confirm
    @home = Home.new(home_params)
    if @home.home =="" || @home.space =="" || @home.area =="" || @home.price =="" || @home.address ==""
      flash[:error] =  "内容を入力してください"
      redirect_to new_home_path
    end
  end
  
  def sendmail
    if params[:addressto] == nil
      @home = Home.near(params[:addressto],5)
    else
      if params[:addresskm] == ""
        @home = Home.near(params[:addressto],5)
        if @home.first == nil
          flash[:error] =  "該当する物件がありませんでした"
        end
      else
        @home = Home.near(params[:addressto],params[:addresskm]) 
        if @home.first == nil
          flash[:error] =  "該当する物件がありませんでした"
        end
      end 
    end

  end
  
  def send_mail 
    @home = Home.near(params[:addressto],5) 
    #"渋谷、東京"
    #ContactMailer.contact_mail(current_user,@homes,params[:title],params[:content]).deliver
    redirect_to homes_send_mail_path
  end
  
  def sendqes
    @homes = Home.find(params[:sendid])
    #@homes = params[:post_id]
    #ContactMailer.contact_mail(current_user,@homes,params[:title],params[:content]).deliver
    
  end
  
  private
  
  def home_params
    params.require(:home).permit(:home, :sikikinn, :reikinn, :space, {image: []}, :area, :price, :address, :ldk,:@curuser,:latitude,:longitude)
  end
  
  def set_home
    @home = Home.find(params[:id])
  end
  
  def login_check
    unless logged_in?
      flash[:error] =  "ログインしてください"
      redirect_to new_session_path
    end
  end
  
  def current_check
    if @home.user_id != current_user.id
      flash[:error] =  "current error"
      redirect_to homes_path
    end
  end
end
