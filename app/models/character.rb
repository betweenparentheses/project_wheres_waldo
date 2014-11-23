class Character < ActiveRecord::Base
  has_many :tags
  validates :name, unique: true, presence: true
end
