class AddOyacategoryToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :oyacategory, index: true, foreign_key: true
  end
end
