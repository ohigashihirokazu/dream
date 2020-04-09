class Dream < ApplicationRecord
	belongs_to :user
	attachment :image
end
