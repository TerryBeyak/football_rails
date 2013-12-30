class AddAwayTeamAndHomeTeamValueToPick < ActiveRecord::Migration
  def change
    remove_column :picks, :value, :integer
    add_column :picks, :home_team_value, :integer
    add_column :picks, :away_team_value, :integer
  end
end
