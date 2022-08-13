class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts,
           dependent: :destroy

  has_many :friend_requests,
           foreign_key: :requester_id,
           dependent: :destroy

  has_many :requested_friends,
           through: :friend_requests,
           source: :recipient

  has_many :friend_invitations,
           foreign_key: :recipient_id,
           class_name: :FriendRequest,
           dependent: :destroy

  has_many :requesting_friends,
           through: :friend_invitations,
           source: :requester

  has_many :friendships,
           dependent: :destroy


  def friends(id)
    list_a = Friendship.where(friend_a_id: id)
    list_b = Friendship.where(friend_b_id: id)
    list_a + list_b
  end

end
