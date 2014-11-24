class Game < ActiveRecord::Base
  has_many :tags

  has_many :characters_tagged, through: :tags, source: :character

  def victory_time
    completed_at - created_at
  end

  def update_score
    time = (1800 - victory_time).round
    self.score = (time > 0) ? time : 0
    self.save
  end

  #query of characters not yet tagged in this game
  def remaining_characters
    characters = self.characters_selected
    characters = ["SQL breaks if this is null"] if characters.empty?

    Character.where("name NOT IN (?)", characters )
  end

  def characters_selected
    self.characters_tagged.pluck(:name)
  end

  def is_high_score?
    Game.high_scores.pluck(:score).include?(self.score)
  end

  def self.high_scores
    Game.order(score: :desc).limit(10).select(:player_name, :score)
  end

  
  

end
