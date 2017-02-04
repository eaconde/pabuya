class AdminController < ApplicationController


  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "admin"
    end
  end
end
