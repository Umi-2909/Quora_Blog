class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def destroy?
    user.admin?
  end

  def update?
    user.admin?
  end

  def edit?
    user.admin? || user == post.user
  end
end
