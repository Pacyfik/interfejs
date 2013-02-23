class CreateStatusTagJoinTable < ActiveRecord::Migration
  def change
    create_table :statuses_tags, :id => false do |t|
      t.integer :status_id
      t.integer :tag_id
    end
  end
end