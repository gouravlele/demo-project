class RepliesController < ApplicationController
	before_action :find_comment
	def create
		@reply=@comment.replies.new(reply_params)
		@reply.user_id=current_user.id if current_user
		@reply.save
	end
	def edit		
		@reply=@comment.replies.find(params[:reply])
		if @reply.user_id==current_user.id
		else
			flash[:alert] = "Sorry! you are not authorized user to edit this reply.."
		  redirect_to posts_path(@post,@comment)	
		end
	end
	def update		
		@reply=@comment.replies.find(params[:id])
		if @reply=current_user.replies.update(reply_params)
	    redirect_to posts_path(@post,@comment)
	  else
 			render :edit
 		end
	end
	def show			
		@reply=Reply.find(params[:id])
	end
	def destroy		
    @reply = @comment.replies.find(params[:id])
    if @reply.user_id==current_user.id
    @reply.destroy
    else
   		flash[:alert] = "Sorry! you are not authorized user to delete this reply.."
    	redirect_to posts_path(@post)
    end	
  end  

	private
		def find_comment
			@post=Post.find(params[:post_id])
			@comment=@post.comments.find(params[:comment_id])
		end

		def reply_params
		params.require(:reply).permit(:body,images_attributes:[:id,:_destroy,:avatar])
		end
end