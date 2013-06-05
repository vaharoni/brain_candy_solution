class CreateBrainCandyCompletions < ActiveRecord::Migration
  def change
    create_table :brain_candy_completions do |t|
      t.references :brain_candy
      t.references :user
      t.datetime :completed_at
      t.references :verifying_user
      t.string :victory_text

      t.timestamps
    end
    add_index :brain_candy_completions, :brain_candy_id
    add_index :brain_candy_completions, :user_id
    add_index :brain_candy_completions, :verifying_user_id
  end
end
