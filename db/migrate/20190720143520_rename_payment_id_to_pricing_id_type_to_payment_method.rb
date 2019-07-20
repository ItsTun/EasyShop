class RenamePaymentIdToPricingIdTypeToPaymentMethod < ActiveRecord::Migration[5.2]
  def change
    rename_column :transactions, :payment_id, :pricing_id
    rename_column :transactions, :type, :payment_method
  end
end
