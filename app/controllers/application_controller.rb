class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequestCommand.call(request.headers).result
    render json: { error: 'Not Authorized', headers: request.headers }, status: 401 unless @current_user
  end
end
