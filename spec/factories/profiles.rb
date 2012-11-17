# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    first_name "MyString"
    last_name "MyString"
    birth_date "2010-11-11"
    bio "MyText"
    gender "M"
    user  { |a| a.association(:user) }
  end
end
