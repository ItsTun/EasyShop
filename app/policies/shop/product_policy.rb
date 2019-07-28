class Shop::ProductPolicy < ApplicationPolicy

  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def index?
    user.has_role?(:admin) || ( user.has_role?(:shop) && product.shop == user )
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
