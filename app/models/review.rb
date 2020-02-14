class Review < ApplicationRecord
	attachment :image_id

	belongs_to :user
	validates :title, :presence => true
	has_many :music_comments, dependent: :delete_all
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    end
end
