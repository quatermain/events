class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false

      t.timestamps null: false
    end
    add_index :user_events, :user_id
    add_index :user_events, :event_id
  end
end
