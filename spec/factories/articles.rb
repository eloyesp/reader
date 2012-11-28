# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    channel nil
    title "MyString"
    link "MyString"
    description "MyText"
    published_date "2012-11-27"
  end
end
