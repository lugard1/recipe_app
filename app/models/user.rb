class User < ApplicationRecord
  validates :name, :surname, presence: true

  has_many :foods, foreign_key: 'user_id'
  has_many :recipes, foreign_key: 'user_id'
end
