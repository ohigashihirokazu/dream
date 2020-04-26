class Dream < ApplicationRecord

	validates :title, presence: true
	validates :body, presence: true

	belongs_to :user
	attachment :image

	has_many :dream_comments, dependent: :destroy

	has_many :favorites, dependent: :destroy
        def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
        end

        def self.search(search)
        	if search
        		Dream.where(['title LIKE ?', "%#{search}%"])
        	else
        		Dream.all
        	end
        end
end
