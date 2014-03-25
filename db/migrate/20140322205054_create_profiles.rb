class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.integer :user_id
      t.string :location
      t.string :favorite_target 
      t.string :birth_year
      t.string :best_catch
      t.string :short_bio

      t.timestamps
    end
  end
end
