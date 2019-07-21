class ShopOrder < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :pricing, class_name: 'Pricing', foreign_key: :pricing_id
  belongs_to :fulfiller,
    class_name: "User",
    foreign_key: :fulfilled_by,
    optional: true

  PAYMENT_CASH_COLLECTION = "cash_collection"
  PAYMENT_BANK_TRANSFER = "bank_transfer"
  PAYMENT_CREDIT = "credit"

  PAYMENT_METHODS = [PAYMENT_CASH_COLLECTION, PAYMENT_BANK_TRANSFER, PAYMENT_CREDIT]

  scope :cancelled, -> { where(status: "cancelled") }
  scope :fulfilled, -> { where(status: "fulfilled") }
  scope :pending, -> { where(status: "pending") }
  scope :active, ->{ where("status = 'fulfilled' AND expired_at > ?", Time.now)}
  scope :expired, -> { where("status = 'fulfilled' AND expired_at < ?", Time.now)}
  scope :shown, -> { where('type NOT IN (?)', ["ExpiryOrder","PremiumTrialOrder"]).order("created_at DESC") }
  scope :current, -> { where("start_at < ? AND expired_at > ?",Time.now,Time.now) }

  def calculate_amount
    quantity * pricing.price
  end

  def is_fulfilled?
    self.status == "fulfilled"
  end

  def is_pending?
    status == "pending"
  end

  def is_cancel?
    status == "cancelled"
  end

  def duration
    quantity.send pricing.unit
  end

  def build_fulfill_hash(fulfilled_by = nil, fulfilled_price = nil)
    built = {
      fulfilled_at: Time.now,
      fulfilled_price: calculate_amount,
      start_at: Time.now,
      expired_at: Time.now + duration,
      status: 'fulfilled'
    }

    _overwrite_fulfiller(fulfilled_by)

    built[:fulfilled_price] = fulfilled_price if fulfilled_price
    built[:fulfilled_by] = fulfiller.id unless fulfiller.nil?

    active_order = other_active_order
    if active_order
      built[:start_at] = active_order.expired_at
      built[:expired_at] = built[:start_at] + duration
    end

    built
  end

  def fulfill(fulfilled_by: nil, fulfilled_price: nil)
    hash = build_fulfill_hash(fulfilled_by,fulfilled_price)
    update hash
  end

  def other_active_order
    ShopOrder
      .active
      .where(orderable_type: orderable_type)
      .last
  end

  protected

  def _overwrite_fulfiller(fulfilled_by)
    self.fulfiller = fulfilled_by if self.fulfiller.nil? && !fulfilled_by.nil?
    self.fulfiller
  end
end
