class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :all_categories
  #helper_method :all_phongban
  #helper_method :all_khoa
  #helper_method :all_gioithieu
  helper_method :all_menu
  helper_method :all_sub_menu
  helper_method :all_posts_thong_bao
  helper_method :all_posts_tuyen_sinh
  helper_method :all_posts_tuyen_dung
  helper_method :all_posts_tin_tuc
  helper_method :all_slider
  helper_method :all_video

  def all_video
    @video=Videohd.order('ordernum asc')

  end

  def all_categories
    @categories=Category.all

  end
  def all_posts_thong_bao
    @category=Category.find('2')
    @post=@category.posts.order(created_at: :desc).limit(5)
  end

  # def all_phongban
  #   @department=Department.all.where(department_type: 0)
  # end

  def all_menu
    @menu=Menu.all.where(parent: [0,nil]).order(order: :asc)
  end

  def all_sub_menu(parent_id)
    @submenu=Menu.all.where(parent: parent_id).order(order: :asc)
  end

  # def all_gioithieu
  #   @category=Category.all.where(category_type: 1)
  # end

  # def all_khoa
  #   @department=Department.all.where(department_type: 1)
  # end
  
  def all_posts_tuyen_sinh
    @category=Category.find('1')
    @post=@category.posts.order(created_at: :desc).limit(5)


  end

  def all_posts_tin_tuc
    @category=Category.find('3')
    @post=@category.posts.order(created_at: :desc).limit(5)


  end
  def all_posts_tuyen_dung
    @category=Category.find('4')
    @post=@category.posts.order(created_at: :desc).limit(5)


  end

  def all_slider
    @slider=Slidercontent.order('ordernum asc')

  end
end