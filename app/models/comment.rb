class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :comments, foreign_key: :parent_id ,dependent: :destroy
  has_many :likes ,dependent: :destroy
  
    scope :with_juice, -> { where(parent_id: nil) }
end
