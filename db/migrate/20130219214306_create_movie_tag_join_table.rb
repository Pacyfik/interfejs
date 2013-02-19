class CreateMovieTagJoinTable < ActiveRecord::Migration
  def change
    create_table :movies_tags, :id => false do |t|
      t.integer :movie_id
      t.integer :tag_id
    end
  end
end
