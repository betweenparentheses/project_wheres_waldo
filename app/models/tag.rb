class Tag < ActiveRecord::Base
  belongs_to :character
  validates :character,
            :position_x,
            :position_y, presence: true
end
