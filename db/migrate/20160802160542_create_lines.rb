class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.belongs_to :story, index: true
      t.string :text
      t.boolean :is_f
      t.integer :report, default: 0

      t.timestamps
    end
  end
end
