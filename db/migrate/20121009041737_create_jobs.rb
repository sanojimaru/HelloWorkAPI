class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :no, null: false
      t.string :url, null: false
      t.string :kind
      t.string :name
      t.string :address
      t.string :tel
      t.string :fax
      t.text :business_description
      t.string :job_type
      t.string :employment_type1
      t.string :industry
      t.string :employment_type2
      t.string :employment_term
      t.string :age_conditions
      t.string :age_conditions_reasons
      t.string :office_hours
      t.string :recess
      t.string :overtime_work
      t.string :office_days_of_week
      t.string :wage
      t.string :bonus
      t.string :holiday
      t.string :two_holidays_of_week
      t.string :holidays_of_year
      t.string :childcare_leave_results
      t.string :usable_day_care_center
      t.string :office_address
      t.string :transfer
      t.string :employees
      t.string :enrollment_insurance
      t.string :age_limit_system
      t.string :reemployment
      t.string :dormitory
      t.string :traveling_by_car
      t.string :commuting
      t.string :recruitment_amount
      t.string :job_description
      t.string :educational_background
      t.string :required_experience
      t.string :required_lisences
      t.string :special_report
      t.string :receipted_at
      t.string :receipted_by
      t.string :expires_at

      t.timestamps
    end
    add_index :jobs, :no, unique: true
    add_index :jobs, :url, unique: true
  end
end
