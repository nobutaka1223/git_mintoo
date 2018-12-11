class AddSubtitleToImagetexts < ActiveRecord::Migration
  def change
    add_column :imagetexts, :subtitle, :string
  end
end
