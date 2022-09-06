class TemplatesController < ApplicationController
  before_action :find_template, only: %i[show edit destroy update]
  skip_after_action :verify_authorized

  def index
    @templates = policy_scope(Template)
    @templates = Template.all
  end

  def show
  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)
    authorize @template
    @template.save
    if @template.save
      redirect_to template_path(@template)
    else
      render :new, notice: "Oops. Something went wrong..."
    end
  end

  def edit
  end

  def update
    authorize @template
    if @template.update(template_params)
      redirect_to template_path(@template), notice: "Updated successfully"
    else
      render :new
    end
  end

  def destroy
    authorize @template
    @template.destroy
    redirect_to templates_path, status: :see_other
  end

  private

  def find_template
    @template = Template.find(params[:id])
  end

  def template_params
    params.require(:template).permit(:title, :content)
  end
end
