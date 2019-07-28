class Api::V1::Shop::HomeController < ApiController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @collections = Collection.where(shop_id: params[:shop_id])
  end
end
