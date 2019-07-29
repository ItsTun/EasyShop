class ImagePolicy < ApplicationPolicy

  attr_reader :user, :image

  def initialize(user, image)
    @user = user
    @image = image
  end

  def show?
    user.has_role?(:admin) || user.has_role?(:shop)
  end

  def destroy?
    show?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
