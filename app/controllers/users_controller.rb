class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new 
  end

  def create

    @user = User.new(user_params)

    if @user.save
      redirect_to login_path, notice: "Successfully made a user"

    else
      redirect_to :back, :flash => { :state => 'register', :errors => @user.errors.full_messages } 
    end

  
  end

  

  def edit
  end

  def show 
    @user = User.find(params[:id])
    @comment = Comment.new  #for simpleform
  end

  def update
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
