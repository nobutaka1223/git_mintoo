class AddUnreadToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :unread, :integer, default:0
  end
end
