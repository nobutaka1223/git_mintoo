class CreatePosttools < ActiveRecord::Migration
  def change
    create_table :posttools do |t|
      t.references :post, index: true, foreign_key: true
      t.references :tool, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
