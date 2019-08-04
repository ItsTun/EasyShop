class ImpressionPolicy < ApplicationPolicy

  attr_reader :user, :impression

  def initialize(user, impression)
    @user = user
    @impression = impression
  end

  def home?
    user.has_role?(:admin) ||  user.has_role?(:shop))
  end

  def detail?
    home?
  end

  def product?
    home?
  end

  def total?
    home?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
