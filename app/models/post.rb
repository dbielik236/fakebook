class Post < ApplicationRecord
  validates :body, presence: true

  belongs_to :user

  has_many :comments,
           as: :commentable,
           dependent: :destroy


  def full_name(user)
    first_name = user.first_name
    last_name = user.last_name
    first_name + last_name
  end
end
