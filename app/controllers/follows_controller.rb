class FollowsController < ApplicationController
	before_action :correct_follow, only: %i(destroy)
	def create
		@conection = Follow.check_followed(current_user.id, params[:follow][:follow_id])
    unless @conection.present?
      @conection = current_user.follows.new follow_params
      if @conection.save
        @user =User.find_by id: @conection.follow_id
        respond_to do |format|
		      format.js
		    end
      end
    end
	end

	def destroy
    if @conection.present?
      @user =User.find_by id: @conection.follow_id
      @conection.destroy
      @conection = false
      respond_to do |format|
		      format.js
		    end
    end
  end

	private

	def correct_follow
    @conection = Follow.find_by id: params[:follow][:id]
    return if @conection
    redirect_to root_path
  end

	def follow_params
    params.require(:follow).permit :follow_id
  end

end
