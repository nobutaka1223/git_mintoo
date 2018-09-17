class AddCategoryToTools < ActiveRecord::Migration
  def change
    add_column :tools, :category, :string, default: "その他"
  end
end
