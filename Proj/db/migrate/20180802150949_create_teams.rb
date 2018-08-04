class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :logo
      t.string :name
      t.string :members, array: true, default: []
      t.string :requests, array: true, default: []
      t.string :captain

      t.timestamps
    end
  end
end
