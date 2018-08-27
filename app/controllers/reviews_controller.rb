class ReviewsController < ApplicationController
	before_action :authenticate_user!
	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new(restaurant: @restaurant)
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = current_user.reviews.new(review_params)
		@review.restaurant = @restaurant
		#@review.user_id = current_user.id
		if @review.save
		 redirect_to @restaurant
		else
			flash[:notice] = "Review is not added"
		end
	end

	private

	def review_params
		params.require(:review).permit(:comment, :rating)
	end
end