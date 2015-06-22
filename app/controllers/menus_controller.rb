class MenusController < ApplicationController
  def show
  	@menu =Menu.find(params[:id])
    @department=Department.where("menu_id=?", @menu.id).first
    @category=Category.joins(:posts).where("posts.department_id=?",@department.id).uniq
  end
end
