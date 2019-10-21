class PhotosController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@photos = params[:photo]['photo'].each do |photo|
			Photo.create(photo: photo, user: @user)
		end
		respond_to do |format|
			format.html { redirect_to user_path(@user) }
			format.js
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		respond_to do |format|
			format.html { redirect_to user_path(current_user) }
			format.js
		end
	end
end
