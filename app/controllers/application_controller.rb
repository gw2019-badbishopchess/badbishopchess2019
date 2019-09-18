class ApplicationController < ActionController::Base
  before_action :authenticate_user! #added to get devise views on every page so I can test devise/onmiauth
  
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
end
