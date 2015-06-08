class PostsController < ApplicationController
  def new
    @post=Post.new
    @category=Category.all
  end

  def edit
    @post=Post.find(params[:id])
  end

  def create
    @post=Post.new post_params
    if @post.save
      redirect_to posts_path,:notice=>"YOur post has been save"
    else
      render "new"
    end
  end

  def update
    @post=Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_path,:notice=>"Post has been updated"
    else
      render "edit"
    end
  end

  def show
    @post=Post.find(params[:id])
    @user=AdminUser.all
    @post_comment=PostComment.new(:post => @post)
  end

  def destroy
    @post=Post.find(params[:id])

    @post.destroy
    redirect_to posts_path,:notice => "your post has been deleted"
  end

  def index
    @posts=Post.order('created_at desc').all
  end

  private
  def post_params
      params.require(:post).permit(:title, :pic, :summary, :content, :category_id, :admin_user_id)
  end
end