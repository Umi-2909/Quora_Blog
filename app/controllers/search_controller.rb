class SearchController < ApplicationController
  def index
    setup_search
  end

  private

  def setup_search
    @post = Post.new
    @query = Post.ransack(search_params)
    @posts = @query.result(distinct: true)
    @user = current_user
  end

  def search_params
    params.require(:q).permit(:your_search_params)
  end
end
