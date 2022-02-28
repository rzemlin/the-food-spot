class Cuisine < ApplicationRecord
    
    has_many :restaurants, dependent: :destroy

end