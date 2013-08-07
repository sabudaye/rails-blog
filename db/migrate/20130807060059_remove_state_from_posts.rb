class RemoveStateFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :state
  end

  def down
    add_column :posts, :state, :integer
  end
end
