class PostsController < ApplicationController
  
   before_action :set_category, only: %i[ show edit update destroy ]
  def index
    #@posts = Post.all
    @query = Post.ransack(params[:q])
    @posts = @query.result(distinct: true)
   
  end

  def show
  
   #@post = Post.find(params[:id])
   @comments = @post.comments.with_juice
   @photo = @post.photos
#

  end

  def edit
    # @post = Post.find(params[:id])#
  end

  def update
     #byebug
     #@post = Post.find(params[:id])
    @post.photos.destroy_all
    params[:post][:avatar].each do |photo|
           @photu = @post.photos.create(avatar: photo)
    end
    @post.update(caption: params[:post][:caption], category_id: params[:post][:category_id])
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(caption: params[:post][:caption], category_id: params[:post][:category_id])
    @post.save
     params[:post][:avatar].each do |photo|
           @photo = @post.photos.create(avatar: photo)
    end
    redirect_to posts_path
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end
  def create_comment
    #byebug
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(feedback: params[:feedback], user_id: current_user.id)
    @comment.save
    @comments = @post.comments.with_juice
  end
  
  def destroy_comment
    # byebug
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
   @comments = @post.comments.with_juice
  end

  def like_dislike
     @comment = Comment.find(params[:comment_id])
     if params[:like] == "true"
         @like = @comment.likes.new(user_id: current_user.id)
         @like.save
     else
         @comment.likes.find_by(user_id:current_user.id).destroy
     end
  end

  def create_reply
   @comment = Comment.find(params[:parent_id])
   @post = @comment.post
   @reply =  @comment.comments.new(feedback: params[:comment][:feedback],post_id: @post.id,user_id: current_user.id)
   @reply.save
   redirect_to post_path(@post.id)
  end

  def destroy_reply
    #byebug
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    @post = Post.find(params[:post_id])
    @comments = @post.comments.with_juice


  end

#   def search
#     byebug
#     if search(search)
#       post_type = Post.find_by(caption: params[:query])
#       if post_type
#         @post.where(id: post_type.id)
#       else
#         @post = Post.all 
#       end
#     else
#         @post = Post.all
#       end
# end

  

  private
   # Use callbacks to share common setup or constraints between actions.
   def set_category
      @post = Post.find(params[:id])
   end

  
end
