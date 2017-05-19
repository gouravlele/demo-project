class CommentsController < ApplicationController
  before_action :set_post,only:[:create, :edit, :update, :show, :destroy]
	def create
		@comment=@post.comments.new(comment_params)
		@comment.user_id=current_user.id if current_user
    @comment.save
  end
	def edit
		@comment=@post.comments.find(params[:id])
		if @comment.user_id != current_user.id    
    	flash[:alert] = "Sorry! you are not authorized user to edit this comment.."
    	redirect_to posts_path(@post)
    end
	end
  def update
    @comment = @post.comments.find(params[:id])
    if @comment=current_user.comments.update(post_params) 
    end
  end
	def show
	  @post=Post.find(params[:post_id])	
		@comment=Comment.find(params[:id]) #/posts/:post_id/comments/:id  
	end
  def destroy
    @comment = @post.comments.find params[:id]
    if @comment.user_id==current_user.id
   	  @comment.destroy
    else
   		flash[:alert] = "Sorry! you are not authorized user to delete this comment.."
    	redirect_to posts_path(@post)
    end		
  end
	private
	 def comment_params
		  params.require(:comment).permit(:body,images_attributes:[:id,:_destroy,:avatar])
	 end
    def set_post
     @post=Post.find(params[:post_id])
    end
end
