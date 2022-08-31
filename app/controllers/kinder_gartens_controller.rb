class KinderGartensController < ApplicationController
  def display_markers(kinder_gartens)
    @markers = kinder_gartens.geocoded.map do |k|
      {
        lat: k.latitude,
        lng: k.longitude
      }
    end
    return @markers
  end

  def index
    if params[:query].present?
      sql_query = "address ILIKE :query"
      @kinder_gartens = KinderGarten.where(sql_query, query: "%#{params[:query]}%")
      # @kinder_gartens = KinderGarten.near(sql_query, query: "%#{params[:query]}%", 5)
    else
      @kinder_gartens = KinderGarten.all
    end
    # @markers = display_markers(@kinder_garte
    @markers = @kinder_gartens.geocoded.map do |k|
      {
        lat: k.latitude,
        lng: k.longitude
      }
    end
  end

  def show
    @kinder_garten = KinderGarten.find(params[:id])
  end
end
