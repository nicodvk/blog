class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/403.html", status: 403
  end
  
  protect_from_forgery with: :exception

  private

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
  	root_path
  end
end
