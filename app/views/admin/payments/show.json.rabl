object @payment

attributes :id, :amount, :created_at, :updated_at

child :bitcoin_address do
  attributes :id, :description
end