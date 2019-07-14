class Api::V1::Shop::OrdersController < ApplicationController
  def index
    @orders = Order.where(shop_id: params[:shop_id])
    render json: Api::V1::Shop::OrderSerializer.new(@orders).serialized_json
  end
end
