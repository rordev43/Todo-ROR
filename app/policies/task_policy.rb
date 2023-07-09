class TaskPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    user_owner?
  end

  def update?
    user_owner?
  end

  def destroy?
    user_owner?
  end

  def complete?
    user_owner?
  end

  def uncomplete?
    user_owner?
  end

  private

  def user_owner?
    user.present? && user == record.user
  end
end
