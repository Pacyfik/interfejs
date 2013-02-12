class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :id2
      t.string :title
      t.integer :year
      t.text :overview
      t.string :genre
      t.string :country
      t.string :poster_path

      t.timestamps
    end
  end
end
