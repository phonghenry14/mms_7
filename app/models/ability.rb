class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, User
      can :manage, Skill
      can :manage, Position
    else
      can :read, User
      can :update, User, id: user.id
      can :create, Userskill
    end
  end
end
