FactoryGirl.define do 

  factory :week do
    season
    start_time Time.now - 1.week
    end_time Time.now + 1.week
    
    factory :week_with_matches do

      ignore do
        matches_count 3
      end

      after(:create) do |week, evaluator|
        FactoryGirl.create_list(:match, evaluator.matches_count, week: week)
      end
    end
  end
end
