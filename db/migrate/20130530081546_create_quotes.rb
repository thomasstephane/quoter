class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :ref, :currency, :discount, :status, :comment
      t.integer :person_id
      t.date :submitted_at, :due_at, :approved_at, :closed_at, :follow_up_at
      t.timestamps
    end
  end
end
