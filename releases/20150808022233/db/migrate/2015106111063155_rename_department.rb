class RenameDepartment < ActiveRecord::Migration
   def change
     rename_table :departments, :pages
   end 
end
