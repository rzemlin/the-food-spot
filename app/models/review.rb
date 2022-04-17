class Review < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant
  
    validates :content, :rating, presence: true

    scope :highest_rated, -> {where("rating > 4") }
  
  end