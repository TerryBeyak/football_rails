class TeamsMatches < ActiveRecord::Migration
  def change
    create_table :matches_teams do |t|
      t.belongs_to :match
      t.belongs_to :team
    end
  end
end
