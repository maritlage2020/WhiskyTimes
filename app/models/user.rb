class User < ApplicationRecord



	  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	attachment :profile_image_id
	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy

  # フォロー用
  # active
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  # passive
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :user

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
