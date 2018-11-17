class RaterController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    if user_signed_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, current_user, params[:dimension]

      @review = obj
      respond_to do |format|
        format.js
      end
    else
      render :json => false
    end
  end
end
