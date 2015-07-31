class ChangeNotNullPost < ActiveRecord::Migration
  def change
  	change_column :posts, :title, :string, :null => false
  	change_column :posts, :summary, :string, :null => false
  	change_column :posts, :content, :text, :null => false
  	change_column :posts, :department_id, :integer, :null => false
  	change_column :posts, :category_id, :integer, :null => false
  	change_column :posts, :admin_user_id, :integer, :null => false
  end
end
