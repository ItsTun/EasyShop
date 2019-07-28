class Shop::DiscountPolicy < ApplicationPolicy

  attr_reader :user, :discount

  def initialize(user, discount)
    @user = user
    @discount = discount
  end

  def index?
    user.has_role?(:admin) || ( user.has_role?(:shop) && discount.shop == user )
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
