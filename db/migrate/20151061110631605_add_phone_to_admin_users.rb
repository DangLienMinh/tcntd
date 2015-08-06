class AddPhoneToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :phone, :string
  end
end
