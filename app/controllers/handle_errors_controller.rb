class HandleErrorsController < ApplicationController
  def no_route
    render json: {error: "No route matches [#{request.method}] #{request.url}"}, status: 404
  end
end
