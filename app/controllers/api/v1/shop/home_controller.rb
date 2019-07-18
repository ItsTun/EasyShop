class Api::V1::Shop::HomeController < ApplicationController
  def index
    @collections = Collection.where(shop_id: params[:shop_id])
  end
end
