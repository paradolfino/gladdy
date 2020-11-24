class CreateLadders < ActiveRecord::Migration[6.0]
  def change
    create_table :ladders do |t|
      t.string :name
      t.integer :size
      t.integer :prize_value
      t.text :description

      t.timestamps
    end
  end
end
