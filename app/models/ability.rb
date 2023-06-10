class Ability
    include CanCan::Ability
  
    def initialize(user)
      can :read, User
  
      return unless user.present?
  
      can(:manage, Category, user: user)
      can(:manage, Expense, user: user)
    end
  end
  