module PicksHelpers
  def put_picks home_team_value, away_team_value
    within "#new_pick" do 
      select home_team_value, from: "pick_home_team_value"
      select away_team_value, from: "pick_away_team_value"
    end
    click_button "Submit"
  end

  def edit_picks home_team_value, away_team_value, pick
    within ".edit_pick" do 
      select home_team_value, from: "pick_home_team_value"
      select away_team_value, from: "pick_away_team_value"
    end
    click_button "Submit"
  end
end
