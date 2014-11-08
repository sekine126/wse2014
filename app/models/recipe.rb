class Recipe < ActiveRecord::Base
  has_attached_file :image
 
  has_many :procedures
  has_many :values

  def index
    @recipes = Recipe.all
  end

end
