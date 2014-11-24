class Tag < ActiveRecord::Base
  belongs_to :character
  belongs_to :game

  validates :character,
            :position_x,
            :position_y, presence: true
end
