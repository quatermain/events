class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.text :description
      t.datetime :date
      t.boolean :active, null: false, default: true

      t.timestamps null: false
    end

    add_index :events, :user_id
  end
end
