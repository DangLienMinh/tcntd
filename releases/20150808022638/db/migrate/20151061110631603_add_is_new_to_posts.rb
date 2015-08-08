class AddIsNewToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_new, :integer, :default => 0
  end
end
