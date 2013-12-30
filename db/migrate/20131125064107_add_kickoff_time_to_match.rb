class AddKickoffTimeToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :kickoff_time, :datetime
  end
end
