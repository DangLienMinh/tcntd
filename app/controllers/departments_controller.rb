class DepartmentsController < ApplicationController
  def show
    
    #@department=Department.find_by_url(params[:id])
    @department=Department.find(params[:id])
    @category=Category.joins(:posts).where("posts.department_id=?",@department.id).uniq
    
    #@category = Category.includes(:posts).select{|c| c.posts.where(['department_id = ?',@department.id])}
    #@category=Category.all
    #@post=Post.where("department_id=?",@department.id).order(created_at: :desc).limit(5)
    # @thongbao=Post.where("category_id = ? and department_id=?",2,@department.id).order(created_at: :desc).limit(5)
    # @tintuc=Post.where("category_id = ? and department_id=?",3,@department.id).order(created_at: :desc).limit(5)
    # @tuyendung=Post.where("category_id = ? and department_id=?",4,@department.id).order(created_at: :desc).limit(5)
    # @tuyensinh=Post.where("category_id = ? and department_id=?",1,@department.id).order(created_at: :desc).limit(5)
  end
end
