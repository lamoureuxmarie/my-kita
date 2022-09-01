class KinderGartensController < ApplicationController
  def display_markers(kinder_gartens)
    @markers = kinder_gartens.geocoded.map do |k|
      {
        lat: k.latitude,
        lng: k.longitude,
        image_url: helpers.asset_url("marker.png"),
        info_window: render_to_string(partial: "info_window", locals: { kinder_garten: k })
      }
    end
  end

  def index
    if params[:query].present?
      sql_query = "address ILIKE :query"
      @kinder_gartens = KinderGarten.where(sql_query, query: "%#{params[:query]}%")
      # @kinder_gartens = KinderGarten.near(sql_query, query: "%#{params[:query]}%", 5)
    else
      @kinder_gartens = KinderGarten.all
    end
    @markers = display_markers(@kinder_gartens)
  end

  def show
    @kinder_garten = KinderGarten.find(params[:id])
  end
end
