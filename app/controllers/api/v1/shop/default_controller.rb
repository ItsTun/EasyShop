class Api::V1::Shop::CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :update, :delete]
  def index
    collections = Collection.all
    render json: Api::V1::Shop::CollectionSerializer.new(collections).serialized_json
  end

  def create
    collection = Collection.new collection_params
    if collection.save
      render json: {success: true,message: 'Collection Successfully Created!'},status: 200
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def show
    if @collection.present?
      render json: Api::V1::Shop::CollectionSerializer.new(@collection).serialized_json
    else
      render json: { success: false}, status: :unprocessable_entity
    end
  end

  def update
    if @collection.present?
      if @collection.update(collection_params)
        render json: {success: true,message: 'Collection Successfully Updated!'},status: 200
      else
        render json: { message: "unprocessable_entity"}
      end
    end
  end

  def destroy
    if @collection.present?
      if @collection.destroy
        render json: {success: true,message: 'Collection Successfully Deleted!'},status: 200
      else
        render json: { message: "unprocessable_entity"}
      end
    end
  end

  private

  def set_collection
    @collection = Collection.find_by(id: params[:id])
  end

  def collection_params
    params.require(:collection).permit(:title, :description)
  end
end
