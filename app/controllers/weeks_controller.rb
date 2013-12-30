class WeeksController < ApplicationController

  def index
    @weeks = current_season.weeks.all
  end

  def show
    @week = current_season.weeks.find(params[:id])
    @picks = current_user.picks.all if current_user
  end

  def new
    @week = current_season.weeks.new
  end

  def edit
    @week = current_season.weeks.find(params[:id])
  end

  def create
    @week = current_season.weeks.new(params[:week])

    if @week.save
      redirect_to [current_season, @week], notice: 'Week was successfully created.' 
    else
      render action: "new" 
    end
  end

  def update
    @week = current_season.weeks.find(params[:id])

    if @week.update_attributes(params[:week])
      redirect_to [current_season, @week], notice: 'Week was successfully updated.' 
    else
      format.html render action: "edit" 
    end
  end

  def destroy
    @week = current_season.weeks.find(params[:id])
    
    if @week.destroy
      redirect_to season_weeks_path 
    end
  end

private

  def current_season
    @current_season = Season.find(params[:season_id])
  end
  helper_method :current_season

  def current_week
    @current_week = current_season.weeks.find(params[:id]) if params[:id]
  end
  helper_method :current_week 
end
