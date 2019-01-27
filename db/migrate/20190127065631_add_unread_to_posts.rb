class AddUnreadToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :unread, :integer
  end
end
