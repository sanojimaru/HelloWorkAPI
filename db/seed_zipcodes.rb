class SeedZipcodes
  class << self
    def seed
      csv_path = Rails.root.join 'db/data/KEN_ALL.CSV'
      open(csv_path, "rb:Shift_JIS:UTF-8", undef: :replace) do |f|
        CSV.new(f).each_with_index do |row, index|
          puts "Processing line number #{index}..."
          Zipcode.create!({
            jis_code: row[0],
            zip_code_old: row[1],
            zip_code: row[2],
            pref_kana: row[3],
            city_kana: row[4],
            town_kana: row[5],
            pref: row[6],
            city: row[7],
            town: row[8],
          })
        end
      end
    end
  end
end
