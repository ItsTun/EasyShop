class ProductOption < ApplicationRecord
  def self.min_requirement_hash
    {1 => "None", 2 => "Quantity", 3 => "Amount"}
  end

  def self.min_requirement_option
    self.min_requirement_hash.map{ |key, value| [value, key] }
  end
end
