class TemplatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all # If users can see all restaurants
      scope.where(user: user) # If users can only see their restaurants
      # scope.where("name LIKE 't%'") # If users can only see restaurants starting with `t`
      # ...
    end
  end

  def new?
    create?
  end

  def create?
    record.user == user
    # true
  end

  def edit?
    update?
  end

  def update?
    record.user == user
    # true
  end

  def destroy?
    record.user == user
    # true
  end
end
