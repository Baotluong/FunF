class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.belongs_to :story, index: true
      t.string :line
      t.boolean :is_f
      t.integer :report

      t.timestamps
    end
  end
end
