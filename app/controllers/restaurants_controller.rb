class RestaurantsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
	before_action :is_admin?, only: [:edit, :update, :destroy]
	def index
		#visitor location locally wont work
		#visitor_location = request.location.latitude
		#visitor_longitude = request.location.longitude
		#we need to hard code lat and logitudes ....

		#visitor_latitude = 44.5555
		#visitor_longitude = -93.34564

		# @restaurants = Restaurant.near([visitor_latitude, visitor_longitude], 20)
		# @italin_resta = Restaurant.where(category_id: 6).near([visitor_latitude, visitor_longitude], 20)


		@restaurants = Restaurant.all

		#restaurent categories - categories

		# @italin_resta = Restaurant.where(category_id: 6), @french, @indian .... etc
		
	end

	def new
		@restaurant = Restaurant.new
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@reviews = Review.where(restaurant_id: @restaurant)

		if @reviews.blank?
			@avg_rating = 0
		else
			@avg_rating = @reviews.average(:rating)
		end
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to @restaurant
		else
			flash[:danger] = @restaurant.errors.full_messages.to_sentence
		end
	end

	def search
		@restaurants = Restaurant.search(params)
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :category_id, :address1, :address2, :description, :zipcode, :phone, :email, :city, :state)
	end

	def is_admin?
		if !current_user.try(:admin?)
			flash[:danger] = "You not authorize"
			redirect_to root_path
		end
	end
end