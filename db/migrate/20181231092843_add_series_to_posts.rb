class AddSeriesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :series, :string
  end
end
