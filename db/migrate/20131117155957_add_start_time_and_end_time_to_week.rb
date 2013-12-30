class AddStartTimeAndEndTimeToWeek < ActiveRecord::Migration
  def change
    add_column :weeks, :start_time, :datetime
    add_column :weeks, :end_time, :datetime
  end
end
