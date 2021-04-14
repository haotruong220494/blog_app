class DashboardsController < ApplicationController
  layout "dashboard"

  def home_page
    @q = Post.ransack params[:q]
    @posts = @q.result.page(params[:page]).where(status: true).per(Settings.per_page.client).order("created_at DESC")
  end
end
