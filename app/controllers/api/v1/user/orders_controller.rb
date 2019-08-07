class Api::V1::User::OrdersController < ApiController
  before_action :authenticate_user!

  def index
    @orders = current_user.user_orders
    render json: Api::V1::Shop::OrderSerializer.new(@orders).serialized_json
  end

  def create
    @order = Order.new order_params
    if @order.save
      render json: {success: true,message: 'Order Successfully Created!'},status: 200
    else
      render json: { message: "unprocessable_entity"}
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :shop_id, :order_type, :amount, product_ids: [])
  end
end
