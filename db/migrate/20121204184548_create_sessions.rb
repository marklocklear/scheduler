class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :org_id
      t.string :name
      t.integer :seats
      t.time :class_timetime
      t.date :class_date
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
