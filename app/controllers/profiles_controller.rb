class ProfilesController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def index
    @profile = Profile.find_by(:user_id => current_user.id)
    if @profile == nil
    @profile = Profile.create(:user_id => current_user.id)
    end
    @profile = Profile.find_by(:user_id => current_user.id)
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
      redirect_to profiles_path, notice: "Profile has been updated."
    else
      render "edit"
    end
  end

  def delete_avatar
    @profile = Profile.find(params[:id])
    @profile.avatar = nil
    @profile.save
    redirect_to profiles_path
  end

  private
  def params_profile
    params.require(:profile).permit(:avatar, :name)
  end
end
