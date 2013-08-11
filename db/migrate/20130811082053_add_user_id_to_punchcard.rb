class AddUserIdToPunchcard < ActiveRecord::Migration
  def change
    add_column :punchcards, :user_id, :integer
  end
end
