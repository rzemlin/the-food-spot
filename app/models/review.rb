class Review < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant
  
    validates :content, :rating, presence: true
  
  end