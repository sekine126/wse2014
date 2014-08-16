class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :ingredient_id
      t.string :name
      t.string :genre
      t.decimal :amount

      t.timestamps
    end
  end
end
