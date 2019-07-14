class Api::V1::Shop::OrdersController < ApplicationController
  before_action :set_delivery, only: [:choose_delivery]
  def index
    @orders = Order.where(shop_id: params[:shop_id])
    render json: Api::V1::Shop::OrderSerializer.new(@orders).serialized_json
  end

  def delivery
    @deliveries = User.where(user_type: 'delivery')
    render json: Api::V1::UserSerializer.new(@deliveries).serialized_json
  end

  def choose_delivery
    if @delivery.update order_params
      render json: {success: true,message: 'delivery Successfully Selected!'},status: 200
    else
      render json: { message: "unprocessable_entity"}
    end
  end

  private

  def set_order
    @delivery = User.find(params[:delivery_id])
  end

  def order_params
    params.require(:order).permit(order_ids: [])
  end
end
