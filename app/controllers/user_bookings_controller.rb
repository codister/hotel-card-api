class UserBookingsController < ApplicationController
  before_action :set_user, only: [:get]
  # GET /users/1/bookings
  def get
    render json: @user.render_bookings
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end
end
