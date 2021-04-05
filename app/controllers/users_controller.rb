class UsersController < ApplicationController
  def index
    @events = Event.order(:department_id)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :duty_station)
  end
end
