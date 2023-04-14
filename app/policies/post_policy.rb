class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # user.admin? ? scope.all : scope.where(user: user)
      scope.all
    end
  end

  def update?
    record.user == user
    # record: the post passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    record.user == user || user.admin
  end
end
