class CategoriesController < ApplicationController
  def post_params
    params.require(:category).permit( :name,:category_type)
  end
  def index
     @a=Category.all
  end
  def show
    @category=Category.find(params[:id])
    # @title=@category.name
    # @post=@category.posts
    @posttd=Post.where("category_id = ?",@category.id).order(:created_at).paginate(:page => params[:page], :per_page => 4)
  end
end
