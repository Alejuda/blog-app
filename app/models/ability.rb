class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, User

    if user&.admin?
      can :manage, :all
    else
      can %i[read create], [Post, Comment]
      can :destroy, Post, author_id: user.id
      can :destroy, Comment, author_id: user.id
    end
  end
end
