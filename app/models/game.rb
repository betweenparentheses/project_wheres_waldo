class Game < ActiveRecord::Base
  has_many :tags

  has_many :characters_tagged, through: :tags, source: :character


  # component of score based on accuracy of tagging
  def accuracy_modifier
    case total_inaccuracy
    when 0..50 then 250
    when 51..100 then 100
    when 100..200 then 0
    when 200..400 then -200
    else -1800 # to deter random clicking
    end
  end

  # component of score based on speed
  def time_score
    (1800 - victory_time).round
  end

  #score's floor is zero
  def update_score
    tentative_score = time_score + accuracy_modifier
    self.score = (tentative_score > 0) ? tentative_score : 0
    self.save
  end

  def characters_selected
    self.characters_tagged.pluck(:name)
  end

  #query of characters not yet tagged in this game
  def remaining_characters
    characters = self.characters_selected
    Character.where.not(:name => characters)
  end

  def is_high_score?
    Game.high_scores.pluck(:score).include?(self.score)
  end

  def self.high_scores
    Game.where.not(score: nil).order(score: :desc).
                     limit(10).select(:player_name, :score)
  end

  private
  
  def victory_time
    completed_at - created_at
  end

  #total distance from true char location for all tags for this game
  def total_inaccuracy
    tags.inject(0) { |memo, tag| memo + tag.distance_from_actual }
  end

end
