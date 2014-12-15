class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.type == 'Users::Admin'
      can :manage, :all
    elsif user && user.type == 'Users::Writer'
      can :read, :all
    else
      can :read, :all
    end
  end
end
