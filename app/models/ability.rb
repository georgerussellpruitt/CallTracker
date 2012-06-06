class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user
    
    if user.role?("Admin")
      can :manage, :all
    elsif user.role?("Auditor")
      can :read, [Call, Contact]
    elsif user.role?("Technician")
      can :read, [Call, Contact]
      can :create, [Call, Contact]
    end

  end

end
