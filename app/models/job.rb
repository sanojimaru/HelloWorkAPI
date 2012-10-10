class Job < ActiveRecord::Base
  attr_accessible :no,
    :url,
    :kind,
    :name,
    :address,
    :tel,
    :fax,
    :business_description,
    :job_type,
    :employment_type1,
    :industry,
    :employment_type2,
    :employment_term,
    :age_conditions,
    :age_conditions_reasons,
    :office_hours,
    :recess,
    :overtime_work,
    :office_days_of_week,
    :wage,
    :bonus,
    :holiday,
    :two_holidays_of_week,
    :holidays_of_year,
    :childcare_leave_results,
    :usable_day_care_center,
    :office_address,
    :transfer,
    :employees,
    :enrollment_insurance,
    :age_limit_system,
    :reemployment,
    :dormitory,
    :traveling_by_car,
    :commuting,
    :recruitment_amount,
    :job_description,
    :educational_background,
    :required_experience,
    :required_lisences,
    :special_report,
    :receipted_at,
    :receipted_by,
    :expires_at

  validates :no, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
end