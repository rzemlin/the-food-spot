class User < ApplicationRecord
    
    has_many :reviews
    has_many :restaurants, through: :reviews

    #email validation
    validates :email, uniqueness: true, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
    validates :name, presence: true

    #bcrypt
    has_secure_password

    def self.from_omniauth(auth)
      # Creates a new user if one does not exist
      @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.password = SecureRandom.hex(10)
          u.uid = auth['info']['uid']
          u.image = auth['info']['image']
      end
  end
        
end