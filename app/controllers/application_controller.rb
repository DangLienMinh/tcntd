class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :all_categories
  helper_method :all_posts
  helper_method :all_posts_by_categories

  def all_categories
  	@categories=Category.all
  end
  def all_posts
  	@posts=Post.all
  end
  def all_posts_by_categories
   @postTuyenSinh = Post.where(:category_id => 1).order('created_at desc').take(5)
  @postThongBao = Post.where(:category_id => 2).order('created_at desc').take(5)
  @postTinTuc = Post.where(:category_id => 3).order('created_at desc').take(5)
  @postTuyenDung = Post.where(:category_id => 4).order('created_at desc').take(5)
  end
end
