class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  # CREATE
  # 1. recuperer le formulaire de creation
  def new
    @restaurant = Restaurant.new
  end
  # 2. soumet le formulaire POST
  def create
    # -> je recupere ce que j'ai soumis de mon form
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    # details
    redirect_to restaurant_path(@restaurant)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # creer une methode pour donner acces aux parametres à l'utilisateur de modifier les params
  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
