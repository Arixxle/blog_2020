class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # joseph@example.com -> self.email.split('@') -> ["joseph", "example.com"] -> [0] ->"joseph".capitalize -> "Joseph"
  def username
    return email.split('@')[0].capitalize
  end
end
