class CreateAccountReceivables < ActiveRecord::Migration
  def change
    create_table :account_receivables do |t|
      t.string  :location
      t.date    :invoice_date
      t.integer :invoice_number
      t.float   :amount_billed
      t.float   :amount_received
      t.float   :amount_outstanding
      t.date    :due_date
      t.string  :purchase_order
      t.timestamps null: false
    end
  end
end
