class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    Comment.find_by(id: params[:id], item_id: params[:item_id]).destroy
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
