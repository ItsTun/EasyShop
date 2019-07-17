class Api::V1::Shop::DiscountsController < ApplicationController
  before_action :set_discount, only: [:show, :update, :destroy]

  def index
    @discounts = Discount.where(shop_id: params[:shop_id])
  end

  def create
    @discount = Discount.new discount_params
    if @discount.save
      render json: {success: true,message: 'Collection Successfully Created!'},status: 200
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def update
    if @discount.update discount_params
      render json: Api::V1::Shop::DiscountSerializer.new(@discount).serialized_json
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def show
    if @discount
      render json: Api::V1::Shop::DiscountSerializer.new(@discount).serialized_json
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def destroy
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
                                       :min_requirements,
                                       :discount_start_date,
                                       :discount_end_date,
                                       product_ids: [])
  end
end
