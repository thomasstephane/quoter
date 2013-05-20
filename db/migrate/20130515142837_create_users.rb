class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :middle_name, :last_name, :status
      t.boolean :active
      t.integer :person_id
      t.timestamps
    end
  end
end
