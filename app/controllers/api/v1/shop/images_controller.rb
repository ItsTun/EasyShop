class Api::V1::Shop::ImagesController < ApiController
  before_action :set_image

  def show
    if @image
      render json: Api::V1::Shop::ImageSerializer.new(@image).serialized_json
    else
      render json: { message: "unprocessable_entity"}
    end
  end

  def destroy
    if @image.purge
      render json: {success: true,message: 'Image Successfully Deleted!'},status: 200
    else
      render json: { message: "unprocessable_entity"}
    end
  end

  private

  def set_image
    @image = Product.find(params[:product_id]).images.find(params[:image_id])
  end
end
