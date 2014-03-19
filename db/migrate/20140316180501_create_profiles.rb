class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :user_id
      t.string :location
      t.string :birth_date
      t.string :favorite_target
      t.string :best_catch
      t.text   :short_bio
    end
  end
end
