class CreateFish < ActiveRecord::Migration
  def change
    create_table :fish do |t|
      t.string :location
      t.string :species
      t.string :lenth
      t.string :weight
      t.string :bait
      t.string :depth
      t.string :temperature
      t.string :other_notes

      t.timestamps
    end
  end
end
