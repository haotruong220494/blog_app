class CategoriesController < ApplicationController
  layout "dashboard"

   def show
    @category = Category.find_by_id params[:slug].delete("^0-9").to_i

    @q = @category.posts.ransack params[:q]
    @posts = @q.result.page(params[:page]).order(created_at: :desc).per(Settings.per_page.post_in_cate)
  end
end
