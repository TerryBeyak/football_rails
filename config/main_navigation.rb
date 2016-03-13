SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :seasons, 'Seasons', seasons_path
    primary.item :week, "This week", season_week_path(current_season, current_week), unless: proc { current_season.nil? && current_week.nil?  }
  end
end