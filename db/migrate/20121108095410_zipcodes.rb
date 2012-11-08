class Zipcodes < ActiveRecord::Migration
  def change
    #全国地方公共団体コード(JIS X0401、X0402)………　半角数字
    #(旧)郵便番号(5桁)………………………………………　半角数字
    #郵便番号(7桁)………………………………………　半角数字
    #都道府県名　…………　半角カタカナ(コード順に掲載)　(注1)
    #市区町村名　…………　半角カタカナ(コード順に掲載)　(注1)
    #町域名　………………　半角カタカナ(五十音順に掲載)　(注1)
    #都道府県名　…………　漢字(コード順に掲載)　(注1,2)
    #市区町村名　…………　漢字(コード順に掲載)　(注1,2)
    #町域名　………………　漢字(五十音順に掲載)　(注1,2)
    create_table :zipcodes do |t|
      t.string :jis_code, null: false
      t.string :zip_code_old, null: false, length: 5
      t.string :zip_code, null: false, length: 7
      t.string :pref_kana, null: false
      t.string :city_kana, null: false
      t.string :town_kana, null: false
      t.string :pref, null: false
      t.string :city, null: false
      t.string :town, null: false

      t.timestamps
    end
  end
end
