class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
    @events = Event.all
    @user = User.all
    gon.event = @events.as_json(:include => [:user])           # js用の変数
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    department = Department.find(params[:id])
    department.destroy
    redirect_to root_path
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end
end
