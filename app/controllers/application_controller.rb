class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  include Pundit
  before_action :set_query


  def set_query
    @query = Post.ransack(params[:q])
  end
end
