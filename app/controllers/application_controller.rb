class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    # Allow the 'name' parameter for the sign_up action
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
    # Allow it for account updates too (if they edit their profile later)
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
  end

  protected
  # this is a hook method that Devise calls after a successful sign in, we can use it to redirect users based on their role
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path
    else
      root_path
    end
  end
end
