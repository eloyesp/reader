# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :suscription do
    user nil
    channel nil
    custom_title ""
  end
end

