class DropMoviesTagsTable < ActiveRecord::Migration
  def up
    drop_table :movies_tags
  end

  def down
  end
end
