class ProfilesController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def index
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(params_profile)
      redirect_to @profile, notice: "Profile has been updated."
    else
      render "edit"
    end
  end

  private
  def params_profile
    params.require(:profile).permit(:picture, :avatar, :name)
  end
end
