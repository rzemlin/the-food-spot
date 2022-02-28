class Restaurant < ApplicationRecord

    belongs_to :cuisine 
    
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews 

    validates :restaurant_name, presence: true

end