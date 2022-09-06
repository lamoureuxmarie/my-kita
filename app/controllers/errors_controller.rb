class ErrorsController < ApplicationController
  # skip_before_action :require_no_authentication, only: [:not_found, :internal_server_error]

  def not_found
    skip_authorization
    render(status: 404)
  end

  def internal_server_error
    skip_authorization
    render(status: 500)
  end
end
