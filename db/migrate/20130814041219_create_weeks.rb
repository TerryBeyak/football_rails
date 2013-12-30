class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :number
      t.belongs_to :season
      
      t.timestamps
    end
  end
end
