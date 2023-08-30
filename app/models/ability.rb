class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can [:read, :create], [Post, Comment]
      can :destroy, [Post, Comment], user_id: user.id
    end
  end
end
