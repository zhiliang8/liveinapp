# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feed do
    target_type "MyString"
    target_id 1
  end
end
