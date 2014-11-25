class Tag < ActiveRecord::Base
  belongs_to :character
  belongs_to :game

  validates :character,
            :position_x,
            :position_y, presence: true

  #calculates distance of tag from real character location
  def distance_from_actual
    char_x, char_y = character.position_x, character.position_y
    x_distance, y_distance = char_x - position_x, char_y - position_y

    Math::sqrt( x_distance**2 + y_distance**2 ).round
  end
end
