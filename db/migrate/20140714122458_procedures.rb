class Procedures < ActiveRecord::Migration
  def change
    add_reference(:procedures, :recipe, index: true)
  end
end
