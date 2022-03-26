class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def after_sign_in_path_for(resource)
    if resource.role == 'producer'

      if resource.producer_user
        producer_id = resource.producer_user.producer_id
        producer_path(producer_id)
      else
        new_producer_path()
      end
    else
      pantries_path
    end
  end
end
