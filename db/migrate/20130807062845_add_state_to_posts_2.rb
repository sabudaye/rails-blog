class AddStateToPosts2 < ActiveRecord::Migration
  def change
    add_column :posts, :state, :string
  end
end
