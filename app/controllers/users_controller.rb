class UsersController < ApplicationController
  require 'happybirthday'

  def index
    @events = current_user.events.order(:department_id)
    birthday = Happybirthday.born_on(current_user.birthday)
    @birthday = birthday.age.years_old
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events.order(:department_id)
    birthday = Happybirthday.born_on(@user.birthday)
    @birthday = birthday.age.years_old
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
