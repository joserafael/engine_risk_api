# frozen_string_literal: true

module Transactions
  class TransactionValidator
    def initialize(transaction_params)
      @user_id = transaction_params[:user_id]
      @merchant_id = transaction_params[:merchant_id]
      @card_number = transaction_params[:card_number]
      @transaction_date = transaction_params[:transaction_date]
      @transaction_amount = transaction_params[:transaction_amount]
      @transaction = Transaction.where(user_id: @user_id)
    end

    def verify_validation
      validations = perform_validations
      return true unless validations.present?

      @error_message = validations.result
      false
    end

    attr_reader :error_message

    private

    def same_last_transaction
      last_transaction = @transaction.where(merchant_id: @merchant_id)
                                     .where(card_number: @card_number)
                                     .where(transaction_amount: @transaction_amount)
                                     .count
      true if last_transaction >= 1
    end

    def many_cbk
      last_date_user_transaction = @transaction.order(transaction_date: :asc)
                                               .limit(1)
                                               .pluck(:transaction_date)

      verify_cbk = @transaction.where(has_cbk: true).where('DATE(transaction_date) BETWEEN ? AND ?',
                                                           last_date_user_transaction, Time.now).count
      true if verify_cbk >= 4
    end

    def perform_validations
      s_last_trans = same_last_transaction
      m_cbk = many_cbk
      error_messages = []
      error_messages << "\nLast transaction with the same values\n" if s_last_trans.present?
      error_messages << "\nmany chargeback\n" if m_cbk.present?
      return nil if error_messages.empty?

      error_message = error_messages.join('')
      StandardReturn.error(error_message)
    end
  end
end
