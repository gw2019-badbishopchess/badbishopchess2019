class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :file_not_found
  
  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  def file_not_found()
    head 404
  end

  protected

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  
end
