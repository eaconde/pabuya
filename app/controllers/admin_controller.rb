class AdminController < ApplicationController
  before_filter :ensure_admin

  private

  def ensure_admin
    unless current_user.admin?
      render :file => "public/404.html", layout: false, :status => :unauthorized
    end
  end

  def layout_by_resource
    devise_controller? ? "devise" : "admin"
  end
end
