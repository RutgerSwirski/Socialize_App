class InvitesController < ApplicationController
	def index
		@user_invites = Invite.where(recipient: current_user, status: 'pending')
		@accepted_invites = Invite.where(recipient: current_user, status: 'accepted').or(Invite.where(sender: current_user, status: 'accepted'))
	end

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
	        format.js # <-- idem
	      end
	    end
	end

	def update
		@invite = Invite.find(params[:id])
		@invite.update(status: 'accepted')
		if @invite.save
	      respond_to do |format|
	        format.html { redirect_to invites_path }
	        format.js
	      end
	    else
	      respond_to do |format|
	        format.html { render 'invites' }
	        format.js
	      end
	    end
	end

	def destroy
		@invite = Invite.find(params[:id])
		@invite.destroy
		respond_to do |format|
			format.html { redirect_to invites_path }
			format.js
		end
	end

	private

	def invite_params
	  params.require(:invite).permit(:location, :date_time)
	end
end
