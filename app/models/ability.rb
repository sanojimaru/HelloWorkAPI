class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :access, :rails_admin
      can :dashboard

      can :index, :all
      can :show, :all
      can :export, :all
      can :history, :all

      can :manage, Admin
    end
  end
end
