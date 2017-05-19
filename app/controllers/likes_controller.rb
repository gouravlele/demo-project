class LikesController < ApplicationController
	def create_post_like
		@post=Post.find(params[:post_id])
    unless @post.likes.where(:user_id => current_user.id).nil?
			@like=@post.likes.new(like_params)
			@like.user_id=current_user.id if current_user
			@like.save
	  end  
	end
  def create_comment_like
  	@post=Post.find(params[:post_id])
  	@comment=@post.comments.find(params[:comment_id])
    unless @comment.likes.where(:user_id => current_user.id).nil?
			@like=@comment.likes.new(like_params)
			@like.user_id=current_user.id if current_user
			@like.save
	  end  
	end
	 def create_reply_like
	 	@post=Post.find(params[:post_id])
	 	@comment=@post.comments.find(params[:comment_id])
	 	@reply=@comment.replies.find(params[:reply_id])
    unless @reply.likes.where(:user_id => current_user.id).nil?
			@like=@reply.likes.new(like_params)
			@like.user_id=current_user.id if current_user
			@like.save
	  end  
	end
	def destroy_post_like
		@post=Post.find(params[:post_id])
		@like = @post.likes.find(params[:like_id])
    @like.destroy	  
	end
	def destroy_comment_like
		@post=Post.find(params[:post_id])
		@comment=@post.comments.find(params[:comment_id])
		@like = @comment.likes.find(params[:like_id])
    @like.destroy	  
	end
	def destroy_reply_like
	  @post=Post.find(params[:post_id])
		@comment=@post.comments.find(params[:comment_id])
		@reply=@comment.replies.find(params[:reply_id])
		@like = @reply.likes.find(params[:like_id])
    @like.destroy	  
	end 
	private
	def like_params
		params.permit(:button)
	end
end
