require 'roo'
class Parser

  def self.import(file, system)
    header_content, errors, reports =[],[],[]
    spreadsheet = open_spreadsheet(file)
    header_row  = Setting.get(system, 'row_start').to_i
    header      = spreadsheet.row(header_row)
    data_row    = header_row + 1
    columns_mapping = Setting.send(system)
    setting_date_format = Setting.get(system, 'date_format').to_s

    (data_row..spreadsheet.last_row).each do |i|
      unless ["Total","Current","16 To 30",' '].include?(spreadsheet.row(i).first)
        row = Hash[[header, spreadsheet.row(i)].transpose]
        records = build_record(row, columns_mapping, setting_date_format, system).except(:row_start, :date_format)
      end
    end

    accounts = AccountReceivable.create(records)
    errors << account.errors
    self.header(system, spreadsheet ) if system == :logisis
  end

  def self.header(system, spreadsheet)
    header = []
    (6..12).each do |i|
      header << spreadsheet.row(i)[1] unless spreadsheet.row(i)[1].downcase.eql?("all")
    end
    header
  end

  def self.build_record(row_hash, columns_mapping, setting_date_format, system)
    new_hash = {}
    date_format = setting_date_format

    columns_mapping.each do |r|
      if r.first == 'invoice_date'
        new_hash[r.first.to_sym] = case system
          when :ats then row_hash[r.last].to_date unless row_hash[r.last].blank? && row_hash[r.last].is_a?(Integer) rescue nil
          when :soft_cargo then Date.strptime(row_hash[r.last], date_format) unless row_hash[r.last].blank? && row_hash[r.last].is_a?(Integer) rescue nil
          when :logisis then Date.strptime(row_hash[r.last], date_format) unless row_hash[r.last].blank? && row_hash[r.last].is_a?(Integer) rescue nil
        end
      else
        new_hash[r.first.to_sym] = row_hash[r.last]
      end
    end

    new_hash
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv"   then  Roo::CSV.new(file.path)
      when ".xls"   then  Roo::Spreadsheet.open(file.path)
      when ".xlsx"  then  Roo::Spreadsheet.open(file.path)
      else raise "Unknown file type: #{File.basename(file)}"
    end
  end

end
