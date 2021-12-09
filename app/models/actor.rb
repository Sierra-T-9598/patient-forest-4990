class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.by_age
    order(:age)
  end

  def self.average_age
    average(:age)
  end 
end
