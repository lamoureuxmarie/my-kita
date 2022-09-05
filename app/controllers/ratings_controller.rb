class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    @kinder_garten = KinderGarten.find(params[:kinder_garten_id])
    authorize @rating # Add this line
  end

  def create
    authorize @rating
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @kinder_garten = KinderGarten.find(params[:kinder_garten_id])
    @rating.kinder_garten = @kinder_garten
    @rating.save
  end

  private

  def rating_params
    params.require(:rating).permit(:content, :rating)
  end
end
