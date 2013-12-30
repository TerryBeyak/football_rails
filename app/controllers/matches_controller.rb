class MatchesController < ApplicationController

  def index
    @matches = current_week.matches.all
  end

  def show
    @match = current_week.matches.find(params[:id])
  end

  def new
    @match = current_week.matches.new
  end

  def edit
    @match = current_week.matches.find(params[:id])
  end

  def create
    @match = current_week.matches.new(params[:match])

    if @match.save
      redirect_to [current_season, current_week, @match], notice: 'Match was successfully created.' 
    else
      render action: "new"
    end
  end

  def update
    @match = current_week.matches.find(params[:id])

    if @match.update_attributes(params[:match])
      redirect_to [current_season, current_week, @match], notice: 'Match was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @match = current_week.matches.find(params[:id])
    @match.destroy

    redirect_to season_week_path(current_season, current_week)
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
end
