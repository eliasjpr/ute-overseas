
# Ats Fields
Setting.create(name: 'invoice_date',    value: 'Invoice Date',        system: :Ats, sort_order: 1)
Setting.create(name: 'invoice_number',  value: 'Invoice Number',      system: :Ats, sort_order: 2)
Setting.create(name: 'amount_billed',   value: 'Invoice Amount',      system: :Ats, sort_order: 3)
Setting.create(name: 'amount_received', value: 'Payment',             system: :Ats, sort_order: 4)
Setting.create(name: 'amount_outstanding', value: 'Balance',          system: :Ats, sort_order: 5)
Setting.create(name: 'due_date',        value: '',                    system: :Ats, sort_order: 6)
Setting.create(name: 'purchase_order',  value: 'Reference Number',    system: :Ats, sort_order: 7)
Setting.create(name: 'row_start',       value: '4',                   system: :Ats, sort_order: 8)


# SoftCargo Fields
Setting.create(name: 'invoice_date',       value: 'Issued',    system: :SoftCargo, sort_order: 1)
Setting.create(name: 'invoice_number',     value: 'Document',  system: :SoftCargo, sort_order: 2)
Setting.create(name: 'amount_billed',      value: 'Amount',    system: :SoftCargo, sort_order: 3)
Setting.create(name: 'amount_received',    value: '',          system: :SoftCargo, sort_order: 4)
Setting.create(name: 'amount_outstanding', value: 'Open',      system: :SoftCargo, sort_order: 5)
Setting.create(name: 'due_date',           value: 'Due',       system: :SoftCargo, sort_order: 6)
Setting.create(name: 'purchase_order',     value: 'Details',   system: :SoftCargo, sort_order: 7)
Setting.create(name: 'row_start',          value: '2',         system: :SoftCargo, sort_order: 8)


# Logisis Fields Main File
Setting.create(name: 'invoice_date',       value: 'Inv Date',       system: :Logisis, sort_order: 1)
Setting.create(name: 'invoice_number',     value: 'Invoice No',     system: :Logisis, sort_order: 2)
Setting.create(name: 'amount_billed',      value: 'Bill Amount',    system: :Logisis, sort_order: 3)
Setting.create(name: 'amount_received',    value: 'Amount Received',system: :Logisis, sort_order: 4)
Setting.create(name: 'amount_outstanding', value: 'Outstanding',    system: :Logisis, sort_order: 5)
Setting.create(name: 'due_date',           value: 'Due Date',       system: :Logisis, sort_order: 6)
Setting.create(name: 'purchase_order',     value: 'Customer PO',    system: :Logisis, sort_order: 7)
Setting.create(name: 'row_start',          value: '4',              system: :Logisis, sort_order: 8)
