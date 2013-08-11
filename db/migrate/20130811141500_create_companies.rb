class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :district
      t.string :address
      t.string :phone
      t.string :postal_code
      t.string :url

      t.timestamps
    end
  end
end
