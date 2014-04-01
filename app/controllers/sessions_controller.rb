class SessionsController < ApplicationController
  #only need these 3 for session 
  def new
  	#user = User.new 
    @user = User.new
  end

  def create

  	 user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
  	 if user == false || user.nil? 
  	 	redirect_to new_session_path, :flash => { :error => 'Email and Password don\'t match.'}
  
  	 else
  	 	sign_in(user)
  	 	redirect_to users_path
  	 end 
  	 	
  end

  def destroy
  	sign_out 
    redirect_to login_path 
  end
end

