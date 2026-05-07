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
end
