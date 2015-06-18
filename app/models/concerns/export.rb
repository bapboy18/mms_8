module Export
  def to_csv 
    CSV.generate do |csv|
      csv << column_names
      all.each do |ex|
        csv << ex.attributes.values_at(*column_names)
      end
    end
  end
end
