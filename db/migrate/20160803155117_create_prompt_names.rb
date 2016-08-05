class CreatePromptNames < ActiveRecord::Migration
  def change
    create_table :prompt_names do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
