class Week < ActiveRecord::Base
  attr_accessible :number, :start_time, :end_time
  belongs_to :season

  has_many :matches
  has_many :picks

  def to_param
    id
  end

  def current_winner
    User.all.sort_by{|user| user.points_by_week(id)}.first
  end

  def winning_teams
    @teams = []
    matches.map {|match| @teams << match.winner }
    @teams
  end

end
