class AddJobAssociationToPunchcard < ActiveRecord::Migration
  def change
    add_column :punchcards, :job_id, :integer
  end
end
