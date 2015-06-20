class DepartmentsController < ApplicationController
  # def phongdaotao
  #   general_tt_tb(1)
  #   @mota=Department.where(id: )
  # end

  def show
    @department=Department.find(params[:id])
    @thongbao=Post.where("category_id = ? and department_id=?",2,@department.id).order(created_at: :desc).limit(5)
    @tintuc=Post.where("category_id = ? and department_id=?",3,@department.id).order(created_at: :desc).limit(5)
  end

  # def phongtaivu
  #   general_tt_tb(2)
  # end

  # def tochuchanhchinh
  #   general_tt_tb(3)
  # end

  # def quanlihs
  #   general_tt_tb(4)
  # end

  # def qttb
  #   general_tt_tb(5)
  # end

  # def general_tt_tb(department_id)
  #   @thongbao=Post.where("category_id = ? and department_id=?",2,department_id).order(created_at: :desc).limit(5)
  #   @tintuc=Post.where("category_id = ? and department_id=?",3,department_id).order(created_at: :desc).limit(5)
  # end
end
