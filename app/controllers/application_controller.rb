# frozen_string_literal: true

class ApplicationController < ActionController::API
  def api_response(data = {}, status_message = '', _messages = [], _status_code = 200)
    render json: {
      data:,
      recommendation: status_message

    }
  end
end
