class AdminController < ApplicationController


  private

  def layout_by_resource
    devise_controller? ? "devise" : "admin"
  end
end
