class Team < ActiveRecord::Base
  has_many :picks
  has_many :matches, foreign_key: "home_team_id"
  has_many :matches, foreign_key: "away_team_id"

  attr_accessible :name

  def to_param
    id
  end
end
