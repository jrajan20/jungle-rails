class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :product 

	validates_presence_of :product_id, :user_id, :description, :rating
end
