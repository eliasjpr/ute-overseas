
# Ats Fields
Setting.create(name: 'invoice_date',    value: 'INVOICE DATE',        system: :Ats)
Setting.create(name: 'invoice_number',  value: 'INVOICE REFERRENCE',  system: :Ats)
Setting.create(name: 'amount_billed',   value: 'INVOICE AMOUNT',      system: :Ats)
Setting.create(name: 'amount_received', value: 'PAYMENT AMOUNT',      system: :Ats)
Setting.create(name: 'amount_outstanding', value: '',                 system: :Ats)
Setting.create(name: 'due_date',        value: '',                    system: :Ats)
Setting.create(name: 'purchase_order',  value: '',                    system: :Ats)
Setting.create(name: 'row_start',       value: '4',                   system: :Ats)


# SoftCargo Fields
Setting.create(name: 'invoice_date',       value: 'Issued',    system: :SoftCargo)
Setting.create(name: 'invoice_number',     value: 'Document',  system: :SoftCargo)
Setting.create(name: 'amount_billed',      value: 'Amount',    system: :SoftCargo)
Setting.create(name: 'amount_received',    value: '',          system: :SoftCargo)
Setting.create(name: 'amount_outstanding', value: 'Open',      system: :SoftCargo)
Setting.create(name: 'due_date',           value: 'Due',       system: :SoftCargo)
Setting.create(name: 'purchase_order',     value: 'Details',   system: :SoftCargo)
Setting.create(name: 'row_start',          value: '2',         system: :SoftCargo)


# Logisis Fields Main File
Setting.create(name: 'invoice_date',       value: 'Inv Date',       system: :Logisis)
Setting.create(name: 'invoice_number',     value: 'Invoice No',     system: :Logisis)
Setting.create(name: 'amount_billed',      value: 'Bill Amount',    system: :Logisis)
Setting.create(name: 'amount_received',    value: 'Amount Received',system: :Logisis)
Setting.create(name: 'amount_outstanding', value: 'Outstanding',    system: :Logisis)
Setting.create(name: 'due_date',           value: 'Due Date',       system: :Logisis)
Setting.create(name: 'purchase_order',     value: 'Customer PO',    system: :Logisis)
Setting.create(name: 'row_start',          value: '4',              system: :Logisis)
