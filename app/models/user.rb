class User < ApplicationRecord
  rolify after_add: -> (user,role){ user.touch }, after_remove: -> (user,role){ user.touch }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # test gitlab bot
  USER_TYPES = %w(user shop delivery)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  has_many :user_roles, dependent: :destroy, class_name: "UserRole"
  has_many :products, dependent: :destroy, class_name: "Product", foreign_key: :shop_id
  has_one :user_order, dependent: :destroy, class_name: "Order", foreign_key: :user_id
  has_many :shop_orders, dependent: :destroy, class_name: "Order", foreign_key: :shop_id
  has_many :discounts, dependent: :destroy, class_name: "Discount", foreign_key: :shop_id
  has_many :collections, class_name: 'Collection', foreign_key: :shop_id
  has_many :transactions, class_name: 'Transaction', foreign_key: :user_id
  has_and_belongs_to_many :delivery_orders, class_name: 'Order', association_foreign_key: "order_id", foreign_key: "delivery_id", :join_table => :deliveries_orders
  has_and_belongs_to_many :deliveries, class_name: 'User', association_foreign_key: "delivery_id", foreign_key: "shop_id", :join_table => :shop_deliveries
  has_and_belongs_to_many :delivery_shops, class_name: 'User', association_foreign_key: "shop_id", foreign_key: "delivery_id", :join_table => :shop_deliveries
  has_and_belongs_to_many :subscribers, class_name: 'User', association_foreign_key: "user_id", foreign_key: "shop_id", :join_table => :shops_subscribers

  after_create :assign_user_type_role

  def assign_user_type_role
    if self.user_type == 'user'
      self.add_role(:user)
    elsif self.user_type == 'shop'
      self.add_role(:shop)
    else
      self.add_role(:delivery)
    end
  end

end
