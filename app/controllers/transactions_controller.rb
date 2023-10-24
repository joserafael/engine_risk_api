# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show]

  def index
    @transactions = Transaction.with_asociation

    render json: @transactions
  end

  def show
    render json: Transaction.with_asociation.find(params[:id])
  end

  def create
    validate_transaction = Transactions::TransactionValidator.new(transaction_params)

    unless validate_transaction.verify_validation
      return api_response({}, 'deny', [validate_transaction.error_message],
                          422)
    end

    @transaction = Transaction.new(transaction_params)

    return api_response({ "transaction_id": @transaction.id }, 'approve', 'OK') if @transaction.save

    api_response({}, 'deny', @transaction.errors)
  end

  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:id, :user_id, :merchant_id, :card_number, :transaction_date,
                                        :transaction_amount, :device_id, :has_cbk)
  end
end
