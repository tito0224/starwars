class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ok(json=nil)
    if json
      render json: { meta: { status: 200, message: "ok" }, response: json }, status: 200
    else
      empty(200)
    end
  end

  def not_found
    render json: { meta: { status: 404, message: "Not found" }}, status: 404
  end

  def error(status, errors)
    render json: { errors: errors }, status: 422
  end

  def empty(status)
    render json: {}, status: status
  end

end
