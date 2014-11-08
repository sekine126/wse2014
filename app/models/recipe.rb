class Recipe < ActiveRecord::Base

  has_many :procedures
  has_many :values

  def index
    @recipes = Recipe.all
  end

end
