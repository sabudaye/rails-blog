class RenameTags < ActiveRecord::Migration
  def up
    rename_table :tags, :post_tags
  end

  def down
    rename_table :post_tags, :tags
  end
end
