class AddDateToPunchcard < ActiveRecord::Migration
  def change
    add_column :punchcards, :date, :date
  end
end
