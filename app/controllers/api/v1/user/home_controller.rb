class Api::V1::User::HomeController < ApiController
  impressionist :actions=>[:index]

  def index
    @products = Product.where(shop_id: params[:shop_id])
  end
end
