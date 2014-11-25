class AddTrueLocationToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :position_x, :integer
    add_column :characters, :position_y, :integer
  end
end
