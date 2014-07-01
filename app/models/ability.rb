class Ability
  include CanCan::Ability

  def initialize(user)
       if user.admin?
         can :manage, :all
       end

       if user.superadmin?
         can :manage, User
       end
  end
end
