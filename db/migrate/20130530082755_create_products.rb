class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :ref, :description, :currency, :status, :comment
      t.float :discount, :price, :cost
      t.integer :person_id
      t.date :submitted_at, :due_at, :approved_at, :closed_at, :follow_up_at
      t.timestamps
    end
  end
end
