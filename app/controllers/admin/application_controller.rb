module Admin
  class ApplicationController < ::ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin!

    layout "admin"

    private

    def ensure_admin!
      unless current_user.admin?
        redirect_to root_path, alert: "You do not have permission to access the Admin Portal."
      end
    end
  end
end