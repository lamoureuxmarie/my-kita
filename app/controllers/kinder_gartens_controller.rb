class KinderGartensController < ApplicationController
  skip_after_action :verify_authorized, only: %i[index show]
  skip_before_action :authenticate_user!

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
    @kinder_gartens = policy_scope(KinderGarten)
    if params[:borough].present?
      sql_query = "borough ILIKE :query"
      @kinder_gartens = KinderGarten.where(sql_query, query: "%#{params[:borough]}%")
      # @kinder_gartens = KinderGarten.near(sql_query, query: "%#{params[:query]}%", 5)
    else
      @kinder_gartens = KinderGarten.all
    end
    @markers = display_markers(@kinder_gartens)
  end

  def show
    # authorize @kinder_garten
    @kinder_garten = KinderGarten.find(params[:id])
    # @kinder_garten.pedagogical_focus.join(",")
  end
end
