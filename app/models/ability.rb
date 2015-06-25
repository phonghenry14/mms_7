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
      can :manage, Project
    else
      can :read, User
      can :update, User, id: user.id
      can :manage, Userskill
      can [:read, :update], Team
      can [:read, :update], Project
      can :manage, UserProject
    end
  end
end
