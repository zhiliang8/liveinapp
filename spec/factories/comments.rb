# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comments do
    app nil
    user nil
    body "MyText"
  end
end
