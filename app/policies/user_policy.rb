class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  def index?
    admin?
  end
  
  def show?
    admin?
  end
  
  def update?
    admin?
    # @current_user.admin? or @current_user == @user
  end
  
  private
  def admin?
    @current_user.admin?
  end
  
  def manager?
    @current_user.manager?
  end
  
end
