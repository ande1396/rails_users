module SessionsHelper

	def sign_in(user)
	    session[:user_id] = user.id
	    set_current_user(user) #if i had it as comments (1) <- go to comments controller, would not need the self.set current user

	    #got the error, that current_user was undefined
  	end

  	def set_current_user(user) #2
    	 @current_user = user
  	end

    def get_current_user
      @current_user ||= User.find(session[:user_id])
    end 

  	def sign_out
      set_current_user(nil)  #sets instance var or@current_user to nil  on line 10
  		session[:user_id] = nil #cuz we set it above line 4, no we are making it nil(i think this means nothing)
  		
  	end
  	#hits the end and return to the method that called it, which was destroy 

    # def current_user
      # @current_user ||= User.find(session[:user_id])
      # @current_user = @current_user || User.find(session[:user_id])
      #top two are the same
      #current user is either the current user or the user that is logged in the for that session
    # end


  	#so for sign out, 
  	#1. gets called from sessions controlller under destroy,
  	#2. sets the session[:user_id] to nothing
  	#3. calls the above current_user with nothing in its parameters, and then sets the instance or @current_user to nothing, 
  	#4. returns back to the current_user(nil), ends, goes back to destroy, and redirects to login_path 
	#always returns something, if onthing, last # line 
end
