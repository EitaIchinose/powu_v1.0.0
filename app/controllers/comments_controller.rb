class CommentsController < ApplicationController
  def create
    @department = Department.find(params[:department_id])
    @comment = @department.comments.build(comment_params)
    if @comment.save
       render :index
    else
      render :error
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update!(comment_update_params)
    render json: @comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :image).merge(user_id: current_user.id, department_id: params[:department_id])
  end

  def comment_update_params
    params.require(:comment).permit(:text)
  end
end
