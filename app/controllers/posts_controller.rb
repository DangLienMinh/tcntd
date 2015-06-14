class PostsController < ApplicationController
  def permitted_params
    params.permit post: [:title, :image,:content,:summary,:category_id, :author_id,:admin_user_id]
  end
 

  def show
    @post=Post.find(params[:id])
    @user=AdminUser.all
    @category=@post.category
    @allpost=@category.posts.where("id != ?",@post.id).order(:created_at).limit(5)
  end
end
