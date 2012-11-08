class Zipcode < ActiveRecord::Base
  attr_accessible :jis_code, :zip_code_old, :zip_code, :pref_kana, :city_kana, :town_kana, :pref, :city, :town
end
