class AddHomeTeamAndAwayTeamToPicks < ActiveRecord::Migration
  def change
    remove_column :picks, :team_id, :integer
    add_column :picks, :hometeam_id, :integer
    add_column :picks, :awayteam_id, :integer
  end
end
