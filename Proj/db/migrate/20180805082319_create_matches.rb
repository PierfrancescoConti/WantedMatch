class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :location
      t.time :time
      t.date :date
      t.integer :team1
      t.integer :team2

      t.timestamps
    end
  end
end
