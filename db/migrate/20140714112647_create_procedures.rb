class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.integer :number
      t.text :detail
      t.integer :sec
      t.boolean :play, default: false

      t.timestamps
    end
  end
end
