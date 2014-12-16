class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.type == 'Users::Admin'
      can :manage, :all
    elsif user && user.type == 'Users::Writer'
      can :read, :all
      can [:create, :read, :update, :destroy, :comment], Post, user_id: user.id
      can [:create, :read, :update, :destroy], Tag, user_id: user.id
      can [:read, :update], User, id: user.id
    elsif user && user.type == 'Users::Guest'
      can :read, :all
      can [:comment], Post
      can [:read, :update], User, id: user.id
    else
      can :read, :all
    end
  end
end
