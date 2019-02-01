class AddUnreadToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unread, :integer, default:0
  end
end
