class User < ApplicationRecord
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
      length: {maximum: 15,minimum: 6}, unless: Proc.new {contact_number_required? }

  validate :contact_number_uniqueness

  validates :user_type, :inclusion => { :in =>  USER_TYPES }, :allow_nil => true, :allow_blank => true

  has_many :user_roles, dependent: :destroy, class_name: "UserRole"
  has_many :collections, dependent: :destroy, class_name: "Collection"
  has_many :products, dependent: :destroy, class_name: "Prodcut"
  has_many :orders, dependent: :destroy, class_name: "Order"
  has_many :discounts, dependent: :destroy, class_name: "UserRole"

end
