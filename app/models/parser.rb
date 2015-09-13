require 'CSV'
require 'roo'

class Parser

  def self.import(file, system)
    errors=[]
    spreadsheet = open_spreadsheet(file)
    header_row  = Setting.get(system, 'row_start').to_i
    header      = spreadsheet.row(header_row)
    data_row    = header_row + 1
    (data_row..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      record = build_record(row, system).except(:row_start)
      errors << AccountReceivable.create(record).errors
    end
    errors
  end

  def self.build_record(row_hash, system)
    new_hash = {}
    Setting.send(system).each do |r|
      new_hash[r.first.to_sym] = row_hash[r.last] if !['row_start','id','created_at', 'updated_at'].include?(r.first)
    end
    new_hash
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xls" then Roo::Spreadsheet.open(file.path)
      when ".xlsx" then Roo::Spreadsheet.open(file.path)
      else raise "Unknown file type: #{File.basename(file)}"
    end
  end

end