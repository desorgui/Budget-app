class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, :all, user_id: user.id

    return unless user.admin?
      
    can :manage, :all

  end
  # user ||= User.new # guest user (not logged in)
  # if user.admin?
  #   can :manage, :all
  # else
  #   can :manage, Category, user_id: user.id
  #   can :manage, Payment, user_id: user.id
  #   can :read, :all
  # end
end
