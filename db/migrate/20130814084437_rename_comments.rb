class RenameComments < ActiveRecord::Migration
  def up
    rename_table :comments, :post_comments
  end

  def down
    rename_table :post_comments, :comments
  end
end
