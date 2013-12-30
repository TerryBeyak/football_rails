require 'spec_helper'

describe "Picks" do
  
  before :each do
    @user = create :user
    sign_in @user
    @season = create :season_with_weeks
    @week = @season.weeks.first

    @first_match = create :match, week: @week
    @second_match = create :match, week: @week
  end

  it "cannot pick the same number twice in a week" do
    visit new_season_week_match_pick_path(@season.id, @week.id, @first_match.id)
    put_picks(1, 0)
    visit new_season_week_match_pick_path(@season.id, @week.id, @second_match.id)
    put_picks(1, 0)

    page.should have_content "value has already been taken"
  end

  it "editing works like normal" do 
    visit new_season_week_match_pick_path(@season.id, @week.id, @first_match.id)
    put_picks(1, 0)
    p = Pick.first 
    visit edit_season_week_match_pick_path(@season.id, @week.id, @first_match.id, p)
    edit_picks(0, 1, p)
    page.should have_content "Pick was successfully updated"
  end
end
