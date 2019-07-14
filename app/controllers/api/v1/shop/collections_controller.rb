class Api::V1::Shop::CollectionsController < ApplicationController
  before_action :set_shop, only: [:create,:show]
  def index
    @collections = Collection.all
    render json: Api::V1::Shop::CollectionSerializer.new(@collections).serialized_json
  end

  def create
    if @shop.update(collection_params)
      render json: {success: true,message: 'Collection Successfully Created!'},status: 200
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def show
    if @shop.present?
      render json: Api::V1::Shop::CollectionSerializer.new(@shop.collections).serialized_json, status: 200
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  private

  def set_shop
    @shop = User.find(params[:shop_id])
  end

  def collection_params
    params.require(:collection).permit(collection_ids: [])
  end
end
