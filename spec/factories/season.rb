FactoryGirl.define do 

  factory :season do
    year "2013"

    factory :season_with_weeks do
      ignore do
        weeks_count 3
      end

      after(:create) do |season, evaluator|
        FactoryGirl.create_list(:week_with_matches, evaluator.weeks_count, season: season)
      end
    end
  end
end
