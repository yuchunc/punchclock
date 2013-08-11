class ChangeWayOfTrackingCurrentJob < ActiveRecord::Migration
  def change
    add_column :users, :current_job_id, :integer
    remove_column :jobs, :ongoing
  end
end
