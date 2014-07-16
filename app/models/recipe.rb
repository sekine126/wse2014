class Recipe < ActiveRecord::Base

  has_many :procedures

  def index
    @recipes = Recipe.all
  end

end
