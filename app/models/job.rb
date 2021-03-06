# -*- coding: utf-8 -*-
class Job < ActiveRecord::Base
  attr_accessible :no,
    :url,
    :kind,
    :name,
    :full_address,
    :pref,
    :zipcode,
    :city,
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

  before_validation :parse_address

  belongs_to :pref_obj, class_name: 'Pref', foreign_key: :pref, primary_key: :name

  validates :no, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true

  default_scope includes(:pref_obj)

  scope :new_jobs, lambda{|limit=20|
    where('name IS NOT NULL').order('created_at DESC').limit(limit)
  }

  class << self
    def each_all(method)
      find_each{|n| n.send(method).save! }
    end
  end

  def parse_address
    self.zipcode = $1 if /(\d{3}-\d{4})/ =~ self.full_address
    if self.zipcode && zipcode_object = Zipcode.find_by_zip_code(self.zipcode.gsub('-', ''))
      self.pref = zipcode_object.pref
      self.city = zipcode_object.city
      self.address = self.full_address.gsub /^.*\d{3}-\d{4}(#{zipcode_object.pref})?(#{zipcode_object.city})?/, ''
    else
      self.pref = $1 if /^.*\d{3}-\d{4}(.+?[都|道|府|県])/ =~ self.full_address
      self.city = $1 if /^.*\d{3}-\d{4}.+?[都|道|府|県](.+[市|区|村|郡])/ =~ self.full_address
      self.address = $1 if /^.*\d{3}-\d{4}.+?[都|道|府|県].+[市|区|村|郡](.*)/ =~ self.full_address
    end

    self.address = self.address.gsub /　{2,}/, '　' if self.address
    self
  end
end
