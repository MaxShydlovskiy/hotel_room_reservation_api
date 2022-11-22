class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    response_obj = {
      user: UserSerializer.new(resource).serializable_hash,
      authorization: {
        token: request.env['warden-jwt_auth.token']
      }
    }

    render json: CaseTransform.camel_lower(response_obj)
  end

  def respond_to_on_destroy
    current_user ? log_out_success : log_out_failure
  end

  def log_out_success
    render json: { message: "Logged out." }, status: :ok
  end
  
  def log_out_failure
    render json: { message: "Logged out failure."}, status: :unauthorized
  end
end
