class Post < ApplicationRecord
  belongs_to :user
  #Active Storage form Rails 5
  has_one_attachied :thumbmail
  has_one_attachied :banner
  #Action Text from Rails 6
  has_rich_text :body

  validates :title, length: ( minimum: 5 )
  validates :body,  length: ( minimum: 25 )

  def optimized_image(image, x, y)
    return image.variant(resize_to_fill: [x, y]).processed
  end
end
