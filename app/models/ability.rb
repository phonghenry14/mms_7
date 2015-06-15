class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, User
      can :manage, Skill
      can :manage, Position
      can :manage, Team
      can :create, UserPosition
    else
      can :read, User
      can :update, User, id: user.id
      can :read, Userskill
    end
  end
end
