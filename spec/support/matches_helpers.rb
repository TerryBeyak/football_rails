module MatchesHelpers

  def enter_scores home_team_score, away_team_score
    within '.edit_match' do 
      fill_in "match_home_team_score", with: home_team_score
      fill_in "match_away_team_score", with: away_team_score
    end
    click_button "Submit"
  end
end
