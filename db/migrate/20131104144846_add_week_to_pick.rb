class AddWeekToPick < ActiveRecord::Migration
  def change
    add_column :picks, :week_id, :integer
  end
end
