class CreatePersons < ActiveRecord::Migration
  def change
    create_table :persons do |t|
      t.string :first_name, :middle_name, :last_name, :address_street, 
      :address_city, :address_country, :email
      t.boolean :gender
      t.integer :zip_code, :phone_number
      t.timestamps
    end
  end
end
