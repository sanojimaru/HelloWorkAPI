class CreatePrefs < ActiveRecord::Migration
  def change
    create_table :prefs do |t|
      t.string :code, length: 2
      t.string :name, length: 10
      t.string :name_alnum, length: 10
      t.string :area, length: 10
      t.string :area_alnum, length: 10

      t.timestamps
    end
    add_index :prefs, :code, unique: true
  end
end
