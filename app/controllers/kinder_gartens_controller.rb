class KinderGartensController < ApplicationController
  def index
    @kinder_gartens = KinderGarten.all
  end

  def show
    @kinder_garten = KinderGarten.find(params[:id])
  end
end
