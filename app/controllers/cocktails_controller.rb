class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    #@ingredient = Ingredient.find()
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    @cocktail.save
    redirect_to @cocktail
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktails_params)
    redirect_to @cocktail
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to @cocktail
  end

  private

  def cocktails_params
  params.require(:cocktail).permit(:name)
  end
end
