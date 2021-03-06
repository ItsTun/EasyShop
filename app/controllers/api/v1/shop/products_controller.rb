class Api::V1::Shop::ProductsController < ApiController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :set_category, only: [:create]
  after_action :verify_authorized

  def index
    @products = Product.where(shop_id: params[:shop_id])
    authorize @products.first
    render json: Api::V1::Shop::ProductSerializer.new(@products).serialized_json
  end

  def create
    @product = Product.new product_params.merge(category_id: set_category)
    authorize @product
    if @product.save
      render json: {success: true,message: 'Product Successfully Created!'},status: 200
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def show
    authorize @product
    if @product.present?
      render json: Api::V1::Shop::ProductSerializer.new(@product).serialized_json
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def update
    authorize @product
    if @product.present?
      if @product.update(product_params)
        render json: {success: true,message: 'Product Successfully Updated!'},status: 200
      else
        render json: { message: "unprocessable_entity"}
      end
    end
  end

  def destroy
    authorize @product
    if @product.present?
      if @product.destroy
        render json: {success: true,message: 'Product Successfully Deleted!'},status: 200
      else
        render json: { message: "unprocessable_entity"}
      end
    end
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def set_category
    @category_id = Collection.find(product_params[:collection_id]).category.id
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :original_price, :quantity, :collection_id, :shop_id, image_ids: [])
  end
end
