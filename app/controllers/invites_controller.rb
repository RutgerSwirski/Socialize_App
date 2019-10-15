class InvitesController < ApplicationController
	def create
	    @user = User.find(params[:user_id])
	    @invite = Invite.new(invite_params)
	    @invite.sender = current_user
	    @invite.recipient = @user
	    @invite.status = 'pending'
	    if @invite.save
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

	private

	def invite_params
	  params.require(:invite).permit(:location, :date_time)
	end
end
