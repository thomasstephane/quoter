class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uername, :first_name, :last_name, :status, :password_hash
      t.boolean :active
      t.timestamps
    end
  end
end
