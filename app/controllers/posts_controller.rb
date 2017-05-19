class PostsController < ApplicationController
	before_action :set_post,only: [ :edit, :update, :show, :destroy ]
	def index
		@post=Post.new
		@posts=Post.all.order("posts.created_at desc")
	end
	def new
		@post=Post.new
	end
	def create
		@post=current_user.posts.create(post_params)
		@post.save
	end
	def edit
		if @post.authorized(current_user)
    	flash[:alert] = "Sorry! you are not authorized user to edit this post.."
    end
	end

	def update
		if @post=current_user.posts.update(post_params) 
		end 	
	end
	def show
	end
	def destroy
		if @post.user_id==current_user.id
		@post.destroy
   	else
   		flash[:alert] = "Sorry! you are not authorized user to delete this post.."
    	redirect_to posts_path
    end	
	end
	private
	def post_params
    params.require(:post).permit(:post,images_attributes:[:id,:_destroy,:avatar])
	end
	def set_post
		@post=Post.find(params[:id])
	end
end
