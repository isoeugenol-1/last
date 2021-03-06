class HomesController < ApplicationController
  before_action :set_home, only: [:edit, :update, :destroy, :show]
  before_action :login_check, only: [:show, :edit, :new, :destroy, :update]
  before_action :current_check, only: [:destroy, :edit, :update]
  include ApplicationHelper
  def index
    @q = Home.ransack(params[:q])
    @home = @q.result.includes(:address)
  end
  
  def new
    if params[:back]
      @home = Home.new(home_params)
      @home.build_address
    else
      @home = Home.new
      @home.build_address
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
  
  def edit;  end
  
  def show
    @favorite = current_user.favorites.find_by(home_id: @home.id)
  end
  
  def destroy
    @home.address.destroy
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
    if params[:full_address] == nil
      @home = Address.near(params[:full_address],5)
    else
      if params[:addresskm] == ""
        @home = Address.near(params[:full_address],5)
        if @home.first == nil
          flash[:error] =  "該当する物件がありませんでした"
        end
      else
        @home = Address.near(params[:full_address],params[:addresskm]) 
        if @home.first == nil
          flash[:error] =  "該当する物件がありませんでした"
        end
      end 
    end
  end
  
  def send_mail 
    @home = Home.near(params[:addressto],5) 
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
    params.require(:home).permit(:home, :sikikinn, :reikinn, :space, {image: []},:image_cache, :area, :price,:ldk,:@curuser,address_attributes: [:id,:country, :state,:city,:address,:postcode,:latitude,:longitude,:_destroy])
  end
  
  def address_params
    params.permit(:country, :state,:city,:address,:postcode,:latitude,:longitude,:@hoid)
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
