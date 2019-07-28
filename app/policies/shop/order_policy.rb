class Shop::OrderPolicy < ApplicationPolicy

  attr_reader :user, :order

  def initialize(user, order)
    @user = user
    @order = order
  end

  def index?
    user.has_role?(:admin) || user.has_role?(:shop) && collection.user == user
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def new?
    index?
  end

  def update?
    index?
  end

  def edit?
    index?
  end

  def destroy?
    index?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
