class User < ApplicationRecord
    
    has_many :reviews
    has_many :restaurants, through: :reviews

    #email validation
    validates :email, uniqueness: true, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
    validates :name, presence: true

    #bcrypt
    has_secure_password
        
end