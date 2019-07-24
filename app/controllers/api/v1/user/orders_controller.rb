class Api::V1::User::OrdersController < ApiController

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
