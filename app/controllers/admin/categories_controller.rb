class Admin::CategoriesController < Admin::BaseController
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
    @category = Category.find_by id: params[:id]
  end

  def update
    @category = Category.find_by id: params[:id]
    if @category.update_attributes params_category
      flash[:success] = "Update category success!"
      redirect_to admin_categories_path
    else
      render "edit"
    end
  end

  def destroy
    Category.find_by(id: params[:id]).destroy
    flash[:success] = "Delete category Success."
    redirect_to admin_categories_path
  end

  private
  def params_category
    params.require(:category).permit(:title, :slug)
  end
end
