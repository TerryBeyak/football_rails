FactoryGirl.define do 

  factory :match do
    week
    home_team {FactoryGirl.create(:team)}
    away_team {FactoryGirl.create(:team)}
    home_team_score 0
    away_team_score 20
  end
end
