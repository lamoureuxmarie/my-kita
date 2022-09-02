class PagesController < ApplicationController
  def home
    @kinder_gartens = KinderGarten.all
  end
end
