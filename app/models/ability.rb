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
      can :create, Userskill
      can [:read, :update], Team
      can [:read, :update], Project
    end
  end
end
