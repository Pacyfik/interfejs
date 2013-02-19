class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :description
      t.boolean :seen
	  t.integer :user_id
	  t.integer :movie_id

      t.timestamps
    end
  end
end
