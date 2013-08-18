class RejectNullForCompanyName < ActiveRecord::Migration
  def change
    change_column :companies, :name, :string, null: false
    change_column :jobs, :name, :string, null: false
  end
end
