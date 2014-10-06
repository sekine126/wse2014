class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.references :food, index: true
      t.references :recipe, index: true
      t.string :value

      t.timestamps
    end
  end
end
