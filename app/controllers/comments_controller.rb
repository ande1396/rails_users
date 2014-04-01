class CommentsController < ApplicationController
  def index
  	@comments = Comment.all 
  end

  def new
  	# @comment = Comment.new 
  end

  def create
  	puts "AAAAAAAAAAAAAAAAAAAAA"
  	puts params
  	puts "AAAAAAAAAAAAAAAAAAAAA"

  	#render :text => params
  	@comment = Comment.new(comment_params)
  	@comment.commenter = get_current_user #calling get method right here
  	# @comment.commenter = User.find(session[:user_id]) # same as above line (comments (1)
  	 # who is doing the commenting? the person who is logged in
  	if @comment.save
  		 redirect_to user_path(params[:comment][:commented_id]) #or user_path (aka the show page)
  		 #need this to go to show page 
  	else
  		puts "NOOOOOOOOO"
  		puts @comment.errors.full_messages 
  		puts "NOOOOOOOOOOOOOO"
  	end



  end

  def show
  	#@comment = Comment.find(params[:id])
  end


  private
    def comment_params
      params.require(:comment).permit(:name, :content, :commented_id)
    end
end
