# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :merchant

  validates :merchant_id, :user_id, :card_number, :transaction_amount, :device_id, presence: true

  attribute :transaction_date, default: Time.now

  scope :with_asociation, lambda {
                            select(:id, :name, :company, :card_number, :transaction_date, :transaction_amount, :device_id, :has_cbk)
                              .joins(:merchant, :user)
                          }

  private

  def last_transaction_user; end
end
