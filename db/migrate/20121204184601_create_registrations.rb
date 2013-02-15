class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :session_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :student_number
      t.integer :phone

      t.timestamps
    end
  end
end
