require 'spec_helper'

describe "Users" do
  
  before :each do
    @season = create :season_with_weeks
    @week = @season.weeks.first
    @match = create :match, week: @week
  end

  it "User can assign final scores to a match" do
    @user = create :user
    visit season_week_match_path(@season.id, @week.id, @match.id)
    enter_scores(1, 0)

    sign_in @user 
    visit new_season_week_match_pick_path(@season.id, @week.id, @match.id)
    put_picks(1, 0)

    @week.current_winner.should eq @user
  end

  it "cannot manage weeks"

  it "cannot view picks before submitting their own"
end

describe "Admin" do 

  before :each do 

  end

  it "can manage weeks"

  it "can manage matches"
end