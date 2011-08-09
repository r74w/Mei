class AddStarterPostIdToDiscussions < ActiveRecord::Migration
  def self.up
    add_column :discussions, :starter_post_id, :integer
  end

  def self.down
    remove_column :discussions, :starter_post_id
  end
end
