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
		if params[:search]
	      @search_results_users = User.search_by_location_and_first_name_and_last_name(params[:search]).geocoded
	      respond_to do |format|
	        format.js { render partial: 'search-results'}
	      end
	    else
	      @users = User.where.not(id: current_user.id).geocoded
	    end

	    if params[:search]
	    	@markers = @search_results_users.map do |user|
		      {
		        lat: user.latitude,
		        lng: user.longitude,
		        infoWindow: render_to_string(partial: "info_window", locals: { user: user })
		      }
		    end
		else
		    @markers = @users.map do |user|
		      {
		        lat: user.latitude,
		        lng: user.longitude,
		        infoWindow: render_to_string(partial: "info_window", locals: { user: user })
		      }
		    end
		end
	end
end
