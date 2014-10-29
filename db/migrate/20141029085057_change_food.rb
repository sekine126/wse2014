class ChangeFood < ActiveRecord::Migration
  def change
  	change_column(:foods, :category, :integer)
  end
end
