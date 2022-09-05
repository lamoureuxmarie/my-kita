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

  # Info box to ask user to register their phone number
  # If new phone registered, update profile with new chat_id
  # Only allow create and send reminder if user.profile.phone_number exists

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :photo)
  end
end
