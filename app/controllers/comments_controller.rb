class CommentsController < ApplicationController
  before_action :load_comment, only: [:edit, :update, :destroy]

  def show_subcomment
    @current_comment = Comment.find_by(id: params[:comment_id])
    @subcomments = Comment.where(comment_id: params[:comment_id])
    respond_to do |format|
      format.html { render @subcomments }
      format.js
    end
  end

  def create_subcomment
    @comment_parent = Comment.find_by(id: params[:parent_id])
    @subcomment_parent = @comment_parent.subcomments.last
    @comment = @comment_parent.subcomments.build(comment_params)
    @comment.post_id = @comment_parent.post_id
    @comment.account_id = current_account.id

    if @comment.save
      respond_to do |format|
        format.html { render @comment }
        format.js
      end
    else
      respond_to do |format|
        format.html { render @comment }
        format.js
      end
    end
  end

  def index
    @post = Post.find(params[:post_id])
    @comment = @post.comment.select_parent_comment

    respond_to do |format|
      format.html { redirect_to @comment }
      format.js
    end
  end

  def create
    @comment = current_account.comments.build(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      respond_to do |format|
        format.html { render @comment }
        format.js
      end
    else
      respond_to do |format|
        format.html { render @comment }
        format.js
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html
      format.js
    end
  end

  # def edit
  #   respond_to do |format|
  #     format.html { render @comment }
  #     format.js
  #   end
  # end

  # def update
  #   if @comment.update(comment_params)
  #     respond_to do |format|
  #       format.html { render @comment }
  #       format.js
  #     end
  #   else
  #     respond_to do |format|
  #       format.html { render @comment }
  #       format.js
  #     end
  #   end
  # end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

  def load_comment
    @comment = Comment.find_by(id: params[:id])
  end

end
