class Api::V1::Shop::CollectionsController < ApiController
  before_action :authenticate_user!
  before_action :set_shop, only: [:update, :show, :destroy]
  after_action :verify_authorized

  def index
    @collections = Collection.where(shop_id: params[:shop_id])
    authorize @collections.first
    render json: Api::V1::Shop::CollectionSerializer.new(@collections).serialized_json, status: 200
  end

  def create
    @collection = Collection.new collection_params
    authorize @collection
    if @collection.save
      render json: {success: true,message: 'Collection Successfully Created!'},status: 200
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def update
    authorize @collection
    if @collection.update collection_params
      render json: Api::V1::Shop::CollectionSerializer.new(@collection).serialized_json, status: 200
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def show
    authorize @collection
    if @collection.present?
      render json: Api::V1::Shop::CollectionSerializer.new(@collection).serialized_json, status: 200
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @collection
    if @collection.destroy
      render json: {success: true,message: 'Collection Successfully Deleted!'},status: 200
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  private

  def set_shop
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:title, :description, :shop_id, :category_id)
  end
end
