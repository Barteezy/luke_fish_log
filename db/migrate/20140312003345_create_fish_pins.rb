class CreateFishPins < ActiveRecord::Migration
  def change
    create_table :fish_pins do |t|
      t.string :user_id
      t.string :location
      t.string :species
      t.string :length
      t.string :weight
      t.string :bait
      t.string :depth
      t.string :temperature
      t.text   :other_notes
    end
  end
end
