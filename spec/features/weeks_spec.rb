require 'spec_helper'

describe "Week" do 

  it "has a winner" do
    @user1, @user2 = create(:user), create(:user)
    @week = create :week_with_matches

    create(:pick, week_id: @week.id, match_id: @week.matches[0].id, user_id: @user1.id, away_team_value: 1, home_team_value: 0)
    create(:pick, week_id: @week.id, match_id: @week.matches[1].id, user_id: @user1.id, away_team_value: 2, home_team_value: 0)
    create(:pick, week_id: @week.id, match_id: @week.matches[2].id, user_id: @user1.id, away_team_value: 3, home_team_value: 0)
    
    create(:pick, week_id: @week.id, match_id: @week.matches[0].id, user_id: @user2.id, away_team_value: 1, home_team_value: 0)
    create(:pick, week_id: @week.id, match_id: @week.matches[1].id, user_id: @user2.id, home_team_value: 2, away_team_value: 0)
    create(:pick, week_id: @week.id, match_id: @week.matches[2].id, user_id: @user2.id, away_team_value: 3, home_team_value: 0)

    @week.current_winner.should eq @user2
  end

  it "can receive submissions of final, valid pick sets from a user"

  it "can resolve ties via tiebreaker guess"

  it "can have a Random player" #maybe after MVP
end
