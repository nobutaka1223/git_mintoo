class CreateImagetexts < ActiveRecord::Migration
  def change
    create_table :imagetexts do |t|
      t.references :post, index: true, foreign_key: true
      t.text :content
      t.string :image
      t.integer :status

      t.timestamps null: false
    end
  end
end
