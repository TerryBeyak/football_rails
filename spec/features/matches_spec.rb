require 'spec_helper'

describe "Matches" do
  
  before :each do
    @admin = create :admin
    sign_in @admin
    @season = create :season_with_weeks
    @week = @season.weeks.first
    @match = create :match, week: @week
  end

  it "Admin can assign final scores to a match" do
    @user = create :user
    visit season_week_match_path(@season.id, @week.id, @match.id)
    enter_scores(1, 0)

    sign_in @user 
    visit new_season_week_match_pick_path(@season.id, @week.id, @match.id)
    put_picks(1, 0)

    @week.current_winner.should eq @user
  end
end
