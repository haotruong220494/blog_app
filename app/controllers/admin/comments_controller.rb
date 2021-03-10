class Admin::CommentsController < Admin::BaseController
  before_action :load_comment

  def show
    @subcomments = Comment.select_sub_comment(@comment.id)
  end

  def destroy
    @comment.destroy
    flash[:success] = "Xóa sản bình luận thành công."
    redirect_to admin_post_path(id: params[:post_id])
  end

  private
  def load_comment
    @comment = Comment.find_by_id(params[:id])
  end
end
