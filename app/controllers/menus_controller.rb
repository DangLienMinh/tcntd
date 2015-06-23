class MenusController < ApplicationController
  def show
  	@menu =Menu.find(params[:id])
    @department=Page.where("menu_id=?", @menu.id).first
    @category=Category.joins(:posts).where("posts.page_id=?",@department.id).uniq
  end
end
