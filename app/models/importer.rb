class Importer
  # ActiveRecord::Model
  # ActiveRecord::Conversion
  # ActiveRecord::Validations

  attr_accessor :file


  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_records.map(&:valid?).all?
      imported_records.each(&:save!)
      true
    else
      imported_records.each_with_index do |product, index|
        product.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_records
    @imported_records ||= load_imported_records
  end

  def load_imported_records
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = Product.find_by_id(row["id"]) || Product.new
      product.attributes = row.to_hash.slice(*Product.accessible_attributes)
      product
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
