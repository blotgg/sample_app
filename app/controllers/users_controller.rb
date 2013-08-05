class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Добро пожаловать в Simple App"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    #не нужно т.к. пердфильтр определяет @user
    #@user = User.find(params[:id])
  end
  
  def update
    #не нужно т.к. пердфильтр определяет @user
    #@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Данные успешно обновленны"
      sign_in @user
      redirect_to @user
    else
      render 'edit'      
    end
  end
  
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
