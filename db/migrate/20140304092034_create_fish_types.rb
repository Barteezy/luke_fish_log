class CreateFishTypes < ActiveRecord::Migration
  def change
    create_table :fish_types do |t|
    	t.string :name
    	t.text :description
    	t.string :image
    end
  end
end
