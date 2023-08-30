class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= current_user

    can :read, User

    if user&.admin?
      can :manage, :all
      puts 'admin!!!!!'
    else
      can %i[read create], [Post, Comment]
      can :destroy, Post, author_id: user.id
      puts 'not admin!!!!!!!'
    end
  end
end
