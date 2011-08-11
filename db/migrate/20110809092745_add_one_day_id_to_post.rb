class AddOneDayIdToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :one_day_id, :string, :limit => 8
  end

  def self.down
    remove_column :posts, :one_day_id
  end
end
