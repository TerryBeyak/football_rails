class Match < ActiveRecord::Base
  # attr_accessible 
  belongs_to :week
  belongs_to :season
  has_many :picks, dependent: :destroy

  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  attr_accessible :home_team_score, :away_team_score, :kickoff_time, :home_team_id, :away_team_id

  validate do 
    teams_must_be_different
  end

  def to_param
    id
  end

  def pick_for_user user
    user.picks.where(match_id: id).first
  end

  def winner
    if home_team_score.present? && away_team_score.present?
      if home_team_score > away_team_score
        @winner = home_team
      end
      if away_team_score > home_team_score
        @winner = away_team
      end
    end
    #TODO figure out ties
    @winner
  end

  def teams_must_be_different
    if home_team.present? && away_team.present?
      if home_team == away_team
        errors.add(:base, "The two competing teams in this game must be different!")
      end
    end
  end
end
