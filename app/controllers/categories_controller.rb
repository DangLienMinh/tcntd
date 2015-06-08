class CategoriesController < ApplicationController
  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def show
    @category=Category.find(params[:id])
    @title=@category.name
    @posts=@category.posts
  end

  def destroy
  end

  def index
    @categories = Category.all
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
