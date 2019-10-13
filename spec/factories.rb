FactoryBot.define do
  factory :user do
    sequence :email do |n|
       "dummyEmail#{n}@gmail.com" 
    end
    password { "secretPas" }
    password_confirmation { "secretPas" }
  end

  factory :game do
    association :user
  end

  factory :piece do
    association :game
  end
end