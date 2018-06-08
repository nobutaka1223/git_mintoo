class CreatePosts < ActiveRecord::Migration

  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :tool, foreign_key: true
      t.string    :title
    
      t.timestamps 
    end
  end
end
