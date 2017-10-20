class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  
  validates :review, presence: true

  default_scope { order("created_at DESC") }

end
