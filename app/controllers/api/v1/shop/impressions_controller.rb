class Api::V1::Shop::ImpressionsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_shop
  def home
    Impression.where(params: {"shop_id"=>"#{@shop}", "format"=>"json"})
              .where( impressionable_type: "Home").count
  end

  def detail
    Impression.where(params: {"shop_id"=>"#{@shop}", "format"=>"json"})
              .where( impressionable_type: "Product").count
  end

  def product
    product = Product.find(params[:id])
    product.impressionist_count
  end

  def total
    Impression.where(params: {"shop_id"=>"#{@shop}", "format"=>"json"}).count
  end

  private

  def set_shop
    @shop = User.find(params[:shop_id])
  end
end
