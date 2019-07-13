class User < ApplicationRecord
  rolify after_add: -> (user,role){ user.touch }, after_remove: -> (user,role){ user.touch }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # test gitlab bot
  USER_TYPES = %w(customer shop_owner delivery_owner)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  validates :name,
      presence: true,
      length: {minimum: 3}

  validates :user_name,
      presence: true,
      uniqueness: true,
      length: {minimum: 3}

  validates :contact_number,
      presence: true,
      length: {maximum: 15,minimum: 6}

  validates :user_type, :inclusion => { :in =>  USER_TYPES }, :allow_nil => true, :allow_blank => true

  has_one :user_order, dependent: :destroy, class_name: "Order"
  has_many :user_roles, dependent: :destroy, class_name: "UserRole"
  has_many :collections, dependent: :destroy, class_name: "Collection"
  has_many :products, dependent: :destroy, class_name: "Prodcut"
  has_many :shop_orders, dependent: :destroy, class_name: "Order"
  has_many :discounts, dependent: :destroy, class_name: "UserRole"
  has_and_belongs_to_many :delivery_orders, class_name: 'Order', association_foreign_key: "delivery_id", foreign_key: "product_id"
  has_and_belongs_to_many :deliveries, class_name: 'User', association_foreign_key: "delivery_id", foreign_key: "shop_owner_id"
  has_and_belongs_to_many :shops, class_name: 'User', association_foreign_key: "shop_owner_id", foreign_key: "delivery_id"

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

end
