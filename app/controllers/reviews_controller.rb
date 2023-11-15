class ReviewsController < ApplicationController
  def new
    @review = Review.new
    # trouver le restaurant qui est dans l'url(id) sur lequel on va add une review
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    # recuperer le restaurant en question
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # reste sur la page...
      render :new
      # si dans un autre controller -> passer le chemin /
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
