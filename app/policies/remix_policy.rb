class RemixPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user
        scope.where(user: user)
      else
        scope.none
      end
    end
  end

  def create?
    user.present? # Only logged in users can create a remix
  end

  def show?
    record.user == user # Only the owner can view a remix
  end

  def audio?
    show? # Only the owner can access the audio
  end
end
