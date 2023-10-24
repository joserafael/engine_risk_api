# frozen_string_literal: true

class StandardReturn
  def self.error(message = nil)
    new(:error, message)
  end

  def self.success(message = nil)
    new(:success, message)
  end

  def initialize(status, message = nil)
    @status = status
    @message = message
  end

  def is_error?
    @status == :error
  end

  def is_success?
    @status == :success
  end

  def result
    @message
  end
end
