class PostsController < ApplicationController
  def permitted_params
    params.permit post: [:title, :image,:content,:summary,:category_id, :author_id,:admin_user_id]
  end

  def show
    @post=Post.find(params[:id])
    @user=AdminUser.all
    @category=@post.category
    @allpost=@category.posts.where("id != ? and department_id=?",@post.id,@post.department_id).order(:created_at).limit(5)
  end
  def showalltintuc
    @posttd=Post.where("category_id = ?",3).paginate(:page => params[:page], :per_page => 2)

  end
  def showallthongbao
    @posttd=Post.where("category_id = ?",2).paginate(:page => params[:page], :per_page => 2)

  end
  def showalltuyensinh
    @posttd=Post.where("category_id = ?",1).paginate(:page => params[:page], :per_page => 2)

  end
  def showalltuyendung
    @posttd=Post.where("category_id = ?",4).paginate(:page => params[:page], :per_page => 2)

  end
end
