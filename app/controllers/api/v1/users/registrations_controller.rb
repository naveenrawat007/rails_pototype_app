class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :null_session
  respond_to :json

  def create
    result = SignupLoginService.new(params).sign_up
    render json: {status: result.status, message: result.message, user: result.user}
  end

end
