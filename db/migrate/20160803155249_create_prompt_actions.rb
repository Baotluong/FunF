class CreatePromptActions < ActiveRecord::Migration
  def change
    create_table :prompt_actions do |t|
      t.string :action

      t.timestamps
    end
  end
end