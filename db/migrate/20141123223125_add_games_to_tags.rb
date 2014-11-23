class AddGamesToTags < ActiveRecord::Migration
  def change
    add_column :tags, :game_id, :integer, null: false
    add_index :tags, [:game_id, :character_id], unique: true
  end
end
