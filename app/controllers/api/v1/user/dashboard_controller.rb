class Api::V1::User::DashboardController < ApiController
  before_action :authenticate_user!

  def index
    @products = current_user.favourites
    render json: Api::V1::Shop::ProductSerializer.new(@products).serialized_json, status: 200
  end
end
