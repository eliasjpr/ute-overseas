class AccountReceivable < ActiveRecord::Base

  # Kariari  gem setting
  paginates_per 25


  validates :invoice_date, :invoice_number, :amount_billed, :amount_received, presence: true

  validates_numericality_of :amount_billed
  validates_numericality_of :amount_received
  validates_numericality_of :amount_outstanding

  scope :total_due, -> (from,to){ where("( (invoice_date + interval '1' day * 30) - current_date) >= ? AND ( ( invoice_date + interval '1' day * 30) - current_date) <= ?", from , to).sum(:amount_outstanding)}

  def self.totals
    [sum(:amount_billed), sum(:amount_received), sum(:amount_outstanding)]
  end

  def self.aging_report
    [ total_due(1,15),total_due(16,30), total_due(31,60), total_due(61,90), total_due(91, 1000)]
  end

  def invoice_date=(date)
    if !date.blank?
      format_str = "%m/%d/" + (date =~ /\d{4}/ ? "%Y" : "%y")
      self[:invoice_date] = Date.parse(date.to_s) rescue Date.strptime(date.to_s, format_str)
    end
  rescue ArgumentError

  end


  def due_date=(date)
    unless date.blank?
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
