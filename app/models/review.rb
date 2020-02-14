class Review < ApplicationRecord
	attachment :review_image

	belongs_to :user
	validates :title, :presence => true
	has_many :review_comments, dependent: :delete_all
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    end
end
