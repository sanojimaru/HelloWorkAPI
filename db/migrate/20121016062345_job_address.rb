class JobAddress < ActiveRecord::Migration
  def up
    add_column :jobs, :full_address, :string
    add_column :jobs, :zipcode, :string
    add_column :jobs, :pref, :string
    add_column :jobs, :city, :string
  end

  def down
    remove_column :jobs, :full_address
    remove_column :jobs, :zipcode
    remove_column :jobs, :pref
    remove_column :jobs, :city
  end
end
