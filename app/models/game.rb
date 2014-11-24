class Game < ActiveRecord::Base
  has_many :tags

  has_many :characters_tagged, through: :tags, source: :character

  def victory_time
    completed_at - created_at
  end

end
