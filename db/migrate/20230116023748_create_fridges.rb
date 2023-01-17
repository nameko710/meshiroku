class CreateFridges < ActiveRecord::Migration[6.0]
  def change
    create_table :fridges do |t|
      t.boolean :availability,  nill: false
      t.string :food,           null: false
      t.float :amount,          null: false
      t.string :unit,           null: false
      t.integer :price,         null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
