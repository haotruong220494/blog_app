class Admin::PostsController < Admin::BaseController
  def index
    @q = Post.ransack params[:q]
    @posts = @q.result.page(params[:page]).per Settings.per_page.default
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
    @post = Post.find_by id: params[:id]
  end

  def update
    @post = Post.find_by id: params[:id]
    if @post.update_attributes params_post
      flash[:success] = "Update post success!"
      redirect_to admin_posts_path
    else
      render "edit"
    end
  end

  def destroy
    Post.find_by(id: params[:id]).destroy
    flash[:success] = "Delete Post Success."
    redirect_to admin_posts_path
  end

  def load_tags
    data = Tag.all.as_json
    render json: { tags:  (data || []) }
  end

  private
  def params_post
    params.require(:post).permit Post::ATTRS
  end
end
