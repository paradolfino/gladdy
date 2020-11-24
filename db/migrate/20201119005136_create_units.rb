class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      t.string :name
      t.decimal :hp
      t.decimal :attack
      t.decimal :defense
      t.decimal :agility
      t.decimal :xp
      t.integer :points
      t.integer :hit
      t.integer :wins
      t.integer :losses
      t.decimal :wl_ratio
      t.integer :status
      t.string :avatar
      t.integer :roll
      t.references :ladder, null: true, foreign_key: true

      t.timestamps
    end
  end
end
