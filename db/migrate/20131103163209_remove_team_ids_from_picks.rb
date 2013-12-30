class RemoveTeamIdsFromPicks < ActiveRecord::Migration
  def change
    remove_column :picks, :hometeam_id, :integer
    remove_column :picks, :awayteam_id, :integer
  end
end
