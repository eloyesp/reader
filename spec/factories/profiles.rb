# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    name "basic"
    max_channels_allowed 10
  end
end

