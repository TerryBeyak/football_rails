class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :picks
  
  def picks_by_week week
    array = []
    picks.where("week_id = ? ", week).map{ |pick| array << {value: pick.value, team: pick.team_picked} }
    array
  end

  def points_by_week week
    points = 0
    picks.where("week_id = ? ", week).each do |pick| 
      if Week.find(week).winning_teams.include? pick.team_picked
        points += pick.value
      end
    end
    points
  end
end
