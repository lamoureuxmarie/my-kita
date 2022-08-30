class KinderGartensController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "address ILIKE :query"
      @kinder_gartens = KinderGarten.where(sql_query, query: "%#{params[:query]}%")
    else
      @kinder_gartens = KinderGarten.all
    end
  end

  def show
    @kinder_garten = KinderGarten.find(params[:id])
  end
end
