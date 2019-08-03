class Api::V1::User::FavouritesController < ApiController
  before_action :authenticate_user!

  def create
    if current_user.update favourite_params
      render json: {success: true,message: 'Order Successfully Created!'},status: 200
    else
      render json: { message: "unprocessable_entity"}
    end
  end

  private

  def favourite_params
    params.require(:favourite).permit(favourite_ids: [])
  end
end

