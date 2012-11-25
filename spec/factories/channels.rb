# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :channel do
    feed_url "MyString"
    title "MyString"
    description "MyText"
    suscription_id 1
    url "MyString"
  end
end
