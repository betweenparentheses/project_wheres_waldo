class Character < ActiveRecord::Base
  has_many :tags
  validates :name, uniqueness: true, presence: true
end
