class KinderGartensController < ApplicationController
  def index
    @kinder_gartens = KinderGarten.all
  end
end
