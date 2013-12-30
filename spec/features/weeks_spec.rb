require 'spec_helper'

describe "Weeks" do 

  it "have a winner" do
    @user1, @user2 = create(:user), create(:user)
    @week = create :week_with_matches

    create(:pick, week_id: @week.id, match_id: @week.matches[0].id, user_id: @user1.id, away_team_value: 1, home_team_value: 0)
    create(:pick, week_id: @week.id, match_id: @week.matches[1].id, user_id: @user1.id, away_team_value: 2, home_team_value: 0)
    create(:pick, week_id: @week.id, match_id: @week.matches[2].id, user_id: @user1.id, away_team_value: 3, home_team_value: 0)
    
    create(:pick, week_id: @week.id, match_id: @week.matches[0].id, user_id: @user2.id, away_team_value: 1, home_team_value: 0)
    create(:pick, week_id: @week.id, match_id: @week.matches[1].id, user_id: @user2.id, home_team_value: 2, away_team_value: 0)
    create(:pick, week_id: @week.id, match_id: @week.matches[2].id, user_id: @user2.id, away_team_value: 3, home_team_value: 0)

    @week.current_winner.should eq @user1
  end
end
