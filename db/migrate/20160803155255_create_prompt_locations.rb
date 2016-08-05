class CreatePromptLocations < ActiveRecord::Migration
  def change
    create_table :prompt_locations do |t|
      t.string :location

      t.timestamps
    end
  end
end