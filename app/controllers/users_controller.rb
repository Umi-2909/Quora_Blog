class UsersController < ApplicationController
  include Pundit
  before_action :set_user, only: %i[show edit update destroy profile]
  # before_action :authorize_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def show
    @posts = @user.posts.order(created_at: :desc)
    increment_view_count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def profile
    @posts = @user.posts.order(created_at: :desc)
    increment_view_count
  end

  private

  def set_user
    @user = User.find(params[:id]) if params[:id].present?
  end

  def authorize_user
    # binding.pry

    authorize(@user)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def increment_view_count
    @user.update(views: @user.views.to_i + 1)
  end
end
