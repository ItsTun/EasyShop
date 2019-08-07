class Api::V1::User::CollectionsController < ApiController
  before_action :set_shop, only: [:update, :show, :destroy]

  def index
    @collections = Collection.where(shop_id: params[:shop_id])
    render json: Api::V1::Shop::CollectionSerializer.new(@collections).serialized_json, status: 200
  end
end
