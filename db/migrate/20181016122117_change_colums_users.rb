class ChangeColumsUsers < ActiveRecord::Migration
  def up
    add_column :users, :accesstoken, :string
    add_column :users, :secrettoken, :string
    remove_column :users, :uid
  end
  
  def down
    remove_column :users, :accesstoken
    remove_column :users, :accesstoken
    add_column :users, :uid, :string
  end
  
end
