class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.integer      :user_id
      t.integer      :tool_id
      t.string        :title
      t.text          :content
      t.text          :image
      t.timestamps 
    end
  end
end
