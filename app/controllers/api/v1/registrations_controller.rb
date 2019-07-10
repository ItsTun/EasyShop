class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(user_params)

    resource.save
    render_resource(resource)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
