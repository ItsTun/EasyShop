class Api::V1::User::SubscriptionsController < ApplicationController
  before_action :set_shop, only: [:create]

  def create
    if @shop.update subscription_params
      render json: {success: true,message: 'Subscription Successfully Created!'},status: 200
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  private

  def set_shop
    @shop = User.find(params[:shop_id])
  end

  def subscription_params
    params.require(:shop).permit(subscriber_ids: [])
  end
end
