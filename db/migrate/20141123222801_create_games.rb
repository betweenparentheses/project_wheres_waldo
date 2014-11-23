class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.integer :score
      t.string :player_name
      
      t.datetime :completed_at
      t.timestamps
    end
  end
end
