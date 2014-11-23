class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :character_id, null: false
      t.integer :position_x
      t.integer :position_y

      t.timestamps
    end
  end
end
