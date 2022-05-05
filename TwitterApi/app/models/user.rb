class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :tweets
  has_many :likes
  has_many :followed, :class_name => "Follow", :foreign_key => 'followed_id'
  has_many :following, :class_name => "Follow", :foreign_key => 'following_id'
end
