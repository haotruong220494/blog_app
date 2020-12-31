class PostsController < ApplicationController
  layout "dashboard"

  def show
    @post = Post.find_by_id params[:slug].delete("^0-9").to_i
  end
end
