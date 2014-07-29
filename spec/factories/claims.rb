# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :claim do
    user_id 1
    reward_id 1
    approved false
  end
end
