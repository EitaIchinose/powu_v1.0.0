class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_department, only: [:index, :create, :show]

  def index
    @departments = Department.all                             # 予定表の表記名用
    @events = Department.find(params[:department_id]).events  # 予定表に関連のある予定だけを抽出
    @comment = Comment.new
    @comments = @department.comments.includes(:user)          # 予定表に関連づいたコメントのみを取得
    gon.event = @events                                       #js用の変数
  end

  def new
    @events = current_user.events.new
  end

  def create
    @events = @department.events.new(event_params)            # 予定表に関連づいた予定のみを抽出
    if @events.save
      redirect_index
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
       redirect_index
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_index
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start_time, :end_time, :id).merge(user_id: current_user.id,
                                                                       department_id: params[:department_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_department
    @department = Department.find(params[:department_id])
  end

  def redirect_index
    redirect_to department_events_path
  end
end
