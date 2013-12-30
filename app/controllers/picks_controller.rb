class PicksController < ApplicationController

  def index
    @users = User.all
    @matches = current_week.matches.all
  end

  def edit
    @pick = current_match.picks.find(params[:id])
  end

  def new
    @pick = current_match.picks.new
  end

  def create
    @pick = current_match.picks.new(params[:pick])
    @pick.user = current_user
    @pick.week = current_week

    if @pick.save
      redirect_to [current_season, current_week], notice: "Your pick has been recorded!"
    else
      render :new
    end
  end

  def update
    @pick = current_match.picks.find(params[:id])

    if @pick.update_attributes(params[:pick])
      redirect_to [current_season, current_week], notice: 'Pick was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  private

  def current_season
    @current_season = Season.find(params[:season_id])
  end
  helper_method :current_season

  def current_week
    @current_week = current_season.weeks.find(params[:week_id])
  end
  helper_method :current_week

  def current_match
    @current_match = current_week.matches.find(params[:match_id])
  end
  helper_method :current_match

  def available_points
    total_matches = Match.where(week_id: current_week).count
    @array = (0..total_matches)

    current_user.picks.where(week_id: current_week).each do |pick|
      @array.reject { |a| a == pick.value }
    end

    @array
  end
  helper_method :available_points

end
