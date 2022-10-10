class Comment < ApplicationRecord
  #Validates
  validates :body, presence: true, length: { maximum: 140 }

  # Associations
  belongs_to :user
  belongs_to :tweet, counter_cache: true  # counter_cache es para que acumule los comentarios, en este caso de los tweets.
end
