# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'

Transaction.destroy_all
Merchant.destroy_all
User.destroy_all

CSV.foreach(Rails.root.join('lib/seeds_csv/users.csv'), headers: true) do |row|
  User.create({
                id: row['id'],
                name: row['name'],
                token: row['token'],
                active: row['active']

              })
end

CSV.foreach(Rails.root.join('lib/seeds_csv/merchants.csv'), headers: true) do |row|
  Merchant.create({
                    id: row['id'],
                    company: row['company'],
                    active: row['active']

                  })
end

CSV.foreach(Rails.root.join('lib/seeds_csv/transactional-sample.csv'), headers: true) do |row|
  Transaction.create({

                       id: row['transaction_id'],
                       merchant_id: row['merchant_id'],
                       user_id: row['user_id'],
                       card_number: row['card_number'],
                       transaction_date: row['transaction_date'],
                       transaction_amount: row['transaction_amount'],
                       device_id: row['device_id'],
                       has_cbk: row['has_cbk']
                     })
end
