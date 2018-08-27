class Review < ActiveRecord::Base
	belongs_to :restaurant, required: true
	belongs_to :user, required: true
end