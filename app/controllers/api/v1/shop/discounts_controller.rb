class Api::V1::Shop::DiscountsController < ApiController
  before_action :authenticate_user!
  before_action :set_discount, only: [:show, :update, :destroy]
  after_action :verify_authorized

  def index
    @discounts = Discount.where(shop_id: params[:shop_id])
    authorize @discounts.first
    render json: Api::V1::Shop::DiscountSerializer.new(@discounts).serialized_json
  end

  def create
    @discount = Discount.new discount_params
    authorize @discount
    if @discount.save
      render json: {success: true,message: 'Collection Successfully Created!'},status: 200
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def update
    authorize @discount
    if @discount.update discount_params
      render json: Api::V1::Shop::DiscountSerializer.new(@discount).serialized_json
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def show
    authorize @discount
    if @discount
      render json: Api::V1::Shop::DiscountSerializer.new(@discount).serialized_json
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @discount
    if @discount.destroy
      render json: {success: true,message: 'Collection Successfully Deleted!'},status: 200
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  private

  def set_discount
    @discount = Discount.find_by(id: params[:id])
  end

  def discount_params
    params.require(:discount).permit(:shop_id,
                                     :discount_code,
                                     :discount_type,
                                     :discount_value,
                                     {:min_requirements => [:none, :quantity, :amount]},
                                     :discount_start_date,
                                     :discount_end_date,
                                     product_ids: [])
  end
end
