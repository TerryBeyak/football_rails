class Pick < ActiveRecord::Base
  attr_accessible :home_team_value, :away_team_value
  attr_reader :value

  belongs_to :match
  belongs_to :week
  belongs_to :user

  validates_numericality_of :value
  validate :only_one_pick_can_be_nonzero
  validates_uniqueness_of :home_team_value, scope: [:week_id, :user_id], if: lambda { |pick| pick.home_team_value > 0}
  validates_uniqueness_of :away_team_value, scope: [:week_id, :user_id], if: lambda { |pick| pick.away_team_value > 0}
  validate :within_current_week

  def only_one_pick_can_be_nonzero
    if home_team_value.present? && away_team_value.present?
      if home_team_value > 0 && away_team_value > 0
        errors.add(:base, "You can only put points on one team!")
      end
    end
  end

  def within_current_week
    if Time.now < week.start_time || Time.now > week.end_time

      errors.add(:base, "You can only submit picks during the current week!")
    end
  end

  def value
    if home_team_value > 0 
      @value = home_team_value
    else
      @value = away_team_value
    end
  end

  def team_picked
    if home_team_value > 0 
      match.home_team
    else
      match.away_team
    end
  end
end
