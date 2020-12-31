class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, only: [:edit, :update]

  def index
    @q = Category.ransack params[:q]
    @categories = @q.result.page(params[:page]).per Settings.per_page.default
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new params_category
    if @category.save
      flash[:success] = "Create category success!"
      redirect_to admin_categories_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @category.update_attributes params_category
      flash[:success] = "Update category success!"
      redirect_to admin_categories_path
    else
      render "edit"
    end
  end

  def destroy
    Category.find_by_id(params[:id].delete("^0-9").to_i).destroy
    flash[:success] = "Delete category Success."
    redirect_to admin_categories_path
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_back(fallback_location: request.referer)
  end

  private
  def load_category
    @category = Category.find_by_id(params[:id].delete("^0-9").to_i)
  end

  def params_category
    params.require(:category).permit Category::ATTRS
  end
end
