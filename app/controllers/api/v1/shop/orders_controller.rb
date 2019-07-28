class Api::V1::Shop::OrdersController < ApiController
  before_action :authenticate_user!
  before_action :set_delivery, only: [:choose_delivery]
  before_action :set_order, only: [:show, :update, :destroy, :delivery, :choose_delivery]
  after_action :verify_authorized

  def index
    @orders = Order.where(shop_id: params[:shop_id])
    authorize @orders.first
    render json: Api::V1::Shop::OrderSerializer.new(@orders).serialized_json
  end

  def create
    @order = Order.new order_params
    authorize @order
    if @order.save
      render json: {success: true,message: 'Order Successfully Created!'},status: 200
    else
      render json: { message: "unprocessable_entity"}
    end
  end

  def show
    authorize @order
    if @order
      render json: Api::V1::Shop::OrderSerializer.new(@order).serialized_json
    else
      render json: { message: "unprocessable_entity"}
    end
  end

  def update
    authorize @order
    if @order.update order_params
      render json: Api::V1::Shop::OrderSerializer.new(@order).serialized_json
    else
      render json: { message: "unprocessable_entity"}
    end
  end

  def delivery
    authorize @order
    @deliveries = User.where(user_type: 'delivery')
    render json: Api::V1::UserSerializer.new(@deliveries).serialized_json
  end

  def choose_delivery
    authorize @order
    if @delivery.update delivery_params
      render json: {success: true,message: 'Delivery Successfully Selected!'},status: 200
    else
      render json: { message: "unprocessable_entity"}
    end
  end

  def destroy
    authorize @order
    if @order.destroy
      render json: {success: true,message: 'Collection Successfully Deleted!'},status: 200
    else
      render json: { message: "unprocessable_entity"}
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_delivery
    @delivery = User.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id, :shop_id, :order_type, :amount, product_ids: [])
  end

  def delivery_params
    params.require(:delivery).permit(delivery_order_ids: [])
  end
end
