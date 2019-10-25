class ReviewsController < ApplicationController
	def create
	    @user = User.find(params[:user_id])
	    @review = Review.new(review_params)
	    @review.reviewer = current_user
	    @review.reviewee = @user
	    if @review.save
	      respond_to do |format|
	        format.html { redirect_to user_path(@user) }
	        format.js  # <-- will render `app/views/reviews/create.js.erb`
	      end
	    else
	      respond_to do |format|
	        format.html { render 'users/show' }
	        format.js  # <-- idem
	      end
	    end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		respond_to do |format|
			format.html { redirect_to user_path(@user) }
			format.js
		end
	end

	private

	def review_params
	  params.require(:review).permit(:rating, :description)
	end
end
