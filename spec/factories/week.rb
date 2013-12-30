FactoryGirl.define do 

  factory :week do
    season
    
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
