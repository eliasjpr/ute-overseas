json.array!(@account_receivables) do |account_receivable|
  json.extract! account_receivable, :id, :location, :invoice_date, :invoice_number, :amount_billed, :amount_received, :due_date, :purchase_order
  json.url account_receivable_url(account_receivable, format: :json)
end
