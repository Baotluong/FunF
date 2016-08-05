class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.boolean :start_f
      t.integer :max

      t.timestamps
    end
  end
end
