class CategoriesController < ApplicationController
  layout "dashboard"

  def show
    @category = Category.find_by_id params[:slug].to_i
  end
end
