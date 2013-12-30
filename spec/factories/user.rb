FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password 'little kittens'

    factory :admin do 
      after(:create) { |user| user.add_role :admin }
    end
  end
end
