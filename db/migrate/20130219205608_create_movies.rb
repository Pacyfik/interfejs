class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :country
      t.string :genre
      t.string :id2
      t.text :overview
      t.string :poster_path
      t.string :title
      t.string :year

      t.timestamps
    end
  end
end
