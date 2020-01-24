class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :memo
      t.date :date
      t.integer :price

      t.timestamps
    end
  end
end
