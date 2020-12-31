class Admin::PostsController < Admin::BaseController
  before_action :load_post, only: [:edit, :update, :destroy]

  def index
    @q = Post.ransack params[:q]
    @posts = @q.result.page(params[:page]).order(created_at: :desc).per Settings.per_page.default
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params_post
    if @post.save
      flash[:success] = "Create post success!"
      redirect_to admin_posts_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @post.update_attributes params_post
      flash[:success] = "Update post success!"
      redirect_to admin_posts_path(page: params[:page])
    else
      render "edit"
    end
  end

  def destroy
    Post.find_by_id(params[:id].delete("^0-9").to_i).destroy
    flash[:success] = "Delete Post Success."
    redirect_to admin_posts_path
  end

  private
  def load_post
    @post = Post.find_by_id(params[:id].delete("^0-9").to_i)
  end

  def params_post
    params.require(:post).permit Post::ATTRS
  end
end
