class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(cocktail: @cocktail)
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    @dose.save!
    redirect_to cocktail_path(@cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
