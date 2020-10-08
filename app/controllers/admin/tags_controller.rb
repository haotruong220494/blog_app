class Admin::TagsController < Admin::BaseController
  def index
    @q = Tag.ransack params[:q]
    @tags = @q.result.page(params[:page]).per Settings.per_page.default
  end

  def new
    @tag = Tag.new
  end

  def create
    binding.pry
    @tag = Tag.new params_tag
    if @tag.save
      flash[:success] = "Create tag success!"
      redirect_to admin_tags_path
    else
      render "new"
    end
  end

  def edit
    @tag = Tag.find_by id: params[:id]
  end

  def update
    @tag = Tag.find_by id: params[:id]
    if @tag.update_attributes params_tag
      flash[:success] = "Update tag success!"
      redirect_to admin_tags_path
    else
      render "edit"
    end
  end

  def destroy
    Tag.find_by(id: params[:id]).destroy
    flash[:success] = "Delete tag success."
    redirect_to admin_tags_path
  end

  private
  def params_tag
    params.require(:tag).permit Tag::ATTRS
  end
end
