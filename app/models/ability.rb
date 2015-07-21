class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can [:edit, :update, :show], User, id: user.id
    end
  end
end
