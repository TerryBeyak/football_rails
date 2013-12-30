class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.belongs_to :season
      t.belongs_to :week

      t.timestamps
    end
  end
end
