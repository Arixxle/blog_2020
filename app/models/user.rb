class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  # joseph@example.com -> self.email.split('@') -> ["joseph", "example.com"] -> [0] ->"joseph".capitalize -> "Joseph"
  def username
    return email.split('@')[0].capitalize
  end

  def comment_created
    self.number_of_commentd = number_of_comments + 1
    save
    number_of_comments
  end
end
