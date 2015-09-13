class AccountReceivable < ActiveRecord::Base

  validates :invoice_date, :invoice_number, :amount_billed, :amount_received, presence: true

  validates_numericality_of :amount_billed
  validates_numericality_of :amount_received
  validates_numericality_of :amount_outstanding


  def invoice_date=(date)
    if !date.blank?
      format_str = "%m/%d/" + (date =~ /\d{4}/ ? "%Y" : "%y")
      self[:invoice_date] = Date.parse(date.to_s) rescue Date.strptime(date.to_s, format_str)
    end
  rescue ArgumentError

  end

  def due_date=(date)
    if !date.blank? &&
      format_str = "%m/%d/" + (date =~ /\d{4}/ ? "%Y" : "%y")
      self[:due_date] = Date.parse(date.to_s) rescue Date.strptime(date.to_s, format_str)
    end
  rescue ArgumentError
  end

  def amount_outstanding=(num)
    num.gsub!(',','') if num.is_a?(String)
    self[:amount_outstanding] = num.to_f
  end

  def amount_billed=(num)
    num.gsub!(',','') if num.is_a?(String)
    self[:amount_billed] = num.to_f
  end

  def amount_received=(num)
    num.gsub!(',','') if num.is_a?(String)
    self[:amount_received] = num.to_f
  end

end
