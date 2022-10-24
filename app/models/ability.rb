class Ability
  include CanCan::Ability
  user ||= User.new # guest user (not logged in)
  if user.admin?
    can :manage, :all
  else
    can :manage, Category, user_id: user.id
    can :manage, Payment, user_id: user.id
    can :read, :all
  end
end
