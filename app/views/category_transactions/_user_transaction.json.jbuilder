json.extract! category_transaction, :id, :name, :photo, :description, :payment, :created_at, :updated_at
json.url user_transaction_url(category_transaction, format: :json)
