class CreateEatenFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :eaten_foods do |t|
      t.string :name
      t.integer :amount
      t.string :eaten_at, default: DateTime.now

      t.timestamps
    end
  end
end
