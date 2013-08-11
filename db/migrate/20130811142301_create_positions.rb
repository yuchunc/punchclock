class CreatePositions < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name, null: false
      t.integer :pay_per_hour
      t.integer :hours_per_week
      t.boolean :ongoing
      t.boolean :deleted
      t.date :start_date
      t.date :end_date
      t.integer :company_id
      t.integer :user_id

      t.timestamps
    end
  end
end
