class RemoveToolIdFromPost < ActiveRecord::Migration
  def change
    remove_reference :posts, :tool, index: true, foreign_key: true
  end
end
