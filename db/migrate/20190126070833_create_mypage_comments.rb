class CreateMypageComments < ActiveRecord::Migration
  def change
    create_table :mypage_comments do |t|
      t.string :text
      t.integer :userpage, index: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false 
    end
  end
end
