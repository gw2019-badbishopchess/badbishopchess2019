FactoryBot.define do
  factory :user do
    sequence :email do |n|
       "dummyEmail#{n}@gmail.com" 
    end
    password { "secretPas" }
    password_confirmation { "secretPas" }
  end
end