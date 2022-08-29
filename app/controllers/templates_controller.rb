class TemplatesController < ApplicationController
  before_action :find_template, only: %i[show edit destroy update]

  def index
    @templates = Template.all
  end

  def show
  end

  private

  def find_template
    @template = Template.find(params[:id])
  end
end
