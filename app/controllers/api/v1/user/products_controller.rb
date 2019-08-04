class Api::V1::User::ProductsController < ApiController
  before_action :set_product, only: [:show]
  impressionist :actions=>[:show]

  def show
    if @product.present?
      impressionist @product
      render json: Api::V1::Shop::ProductSerializer.new(@product).serialized_json
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
  end
end
