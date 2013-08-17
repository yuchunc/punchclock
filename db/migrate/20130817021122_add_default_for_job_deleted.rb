class AddDefaultForJobDeleted < ActiveRecord::Migration
  def change
    change_column :jobs, :deleted, :boolean, default: false
  end
end
