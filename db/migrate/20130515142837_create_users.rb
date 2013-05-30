class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :first_name, :last_name, :status, :password_hash, :email
      t.boolean :active
      t.timestamps
    end
  end
end
