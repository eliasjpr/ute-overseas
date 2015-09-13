class CreateAccountReceivables < ActiveRecord::Migration
  def change
    create_table :account_receivables do |t|
      t.string  :location
      t.date    :invoice_date
      t.string :invoice_number
      t.decimal   :amount_billed, precision: 64, scale: 10
      t.decimal   :amount_received, precision: 64, scale: 10
      t.decimal   :amount_outstanding, precision: 64, scale: 10
      t.date    :due_date
      t.string  :purchase_order
      t.timestamps null: false
    end
  end
end
