class FixColumnNamePost < ActiveRecord::Migration
  def self.up
    rename_column :posts, :title, :name
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
