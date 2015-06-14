class CategoriesController < ApplicationController
  def post_params
    params.require(:category).permit( :name)
  end
  def index
     @a=Category.all

  end
  def show
    @category=Category.find(params[:id])
    @title=@category.name
    @post=@category.posts
  end
end
