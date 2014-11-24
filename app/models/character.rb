class Character < ActiveRecord::Base
  has_many :tags

  has_many :games, through: :tags
  validates :name, uniqueness: true, presence: true
end
