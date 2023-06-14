# need to follow the subfolder's naming here V
class Api::V1::BaseController < ActionController::API
  # protected so only certain people have access to certain things
  include Pundit

  # check pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  # errors. without these would send html pages
  rescue_from Pundit::NotAuthorizedError,   with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private
  # what to do if an error occurs
  def user_not_authorized(exception)
    render json: {
      error: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
    }, status: :unauthorized
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
