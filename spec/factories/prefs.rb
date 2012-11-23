# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pref do
    code 1
    name "MyString"
    name_alnum "MyString"
    area "MyString"
    area_alnum "MyString"
  end
end
