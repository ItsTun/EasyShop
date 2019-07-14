class Api::V1::Shop::OrdersController < ApplicationController
  def index
    @orders = Order.where(shop_id: params[:shop_id])
  end
end
