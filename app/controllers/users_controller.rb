class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
		@invite = Invite.new
		@review = Review.new
		@invite_sent = Invite.where(recipient: @user, sender: current_user)
		@user_reviews = Review.where(reviewee: @user)
		@image = Photo.new
	end

	def index
		@users = User.where.not(id: current_user.id).geocoded

		if params[:location].present?
			@users = User.where.not(id: current_user.id).near(params[:location], params[:distance].to_i)
		end

	    @markers = @users.map do |user|
	      {
	        lat: user.latitude,
	        lng: user.longitude,
	        infoWindow: render_to_string(partial: "info_window", locals: { user: user })
	      }
	    end
	end
end
