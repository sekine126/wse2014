class Procedure < ActiveRecord::Base
  belongs_to :recipe

  def show
    @procedure = Procedure.find(params[:id])
  end
end
