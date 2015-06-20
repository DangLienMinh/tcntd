class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :all_categories
  helper_method :all_posts_thong_bao
  helper_method :all_posts_tuyen_sinh
helper_method :all_posts_tuyen_dung
helper_method :all_posts_tin_tuc
  helper_method :all_slider
  def all_categories
    @categories=Category.all

  end
  def all_posts_thong_bao
    @category=Category.find('2')
    @post=@category.posts.order(created_at: :desc).limit(5)


  end
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