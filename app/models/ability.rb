class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, :all, user_id: user.id

    return unless user.admin?
      
    can :manage, :all

  end
end
