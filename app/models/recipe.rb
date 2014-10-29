class Recipe < ActiveRecord::Base

  has_many :procedures
  accepts_nested_attributes_for :procedures

  def index
    @recipes = Recipe.all
  end

end
