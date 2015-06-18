module CsvExports
  def to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |f|
        csv << f.attributes.values_at(*column_names)
      end
    end
  end
end
