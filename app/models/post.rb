class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments , dependent: :destroy
  has_many :photos ,dependent: :destroy
  # validates :caption, presence: true

  # def self.search(search)
  #   if search
  #     user_type = User.find_by(caption: search)
  #     if user_type
  #       self.where(id: user_type)
  #     else
  #       @post = Post.all 
  #     end
  #   else
  #     @post = Post.all 
  #   end
end
