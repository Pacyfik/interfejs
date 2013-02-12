class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :description
      t.boolean :seen

      t.timestamps
    end
  end
end
