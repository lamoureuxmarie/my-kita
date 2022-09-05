class ProfilesController < ApplicationController
  before_action :find_profile, only: %i[show edit update]

  def show
    authorize @profile
  end

  def edit
    authorize @profile

  end

  def update
    authorize @profile
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: "Updated successfully"
    else
      render :edit
    end
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :photo)
  end
end
