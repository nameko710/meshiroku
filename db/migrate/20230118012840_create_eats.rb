class CreateEats < ActiveRecord::Migration[6.0]
  def change
    create_table :eats do |t|
      t.string :title,         null: false
      t.integer :price,        null: false
      t.text :comment
      t.date :string,          null: false
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
