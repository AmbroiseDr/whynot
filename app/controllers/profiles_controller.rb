#act as user controller
class ProfilesController < ApplicationController

  def show
  end

  def edit
    @profile = current_user
  end

  def update
    tags = profile_params[:tags].split(",")
    current_user.tag_list.add(tags)
    p current_user.tag_list
    redirect_to root_path
  end

  private

  def profile_params
    params.require(:user).permit(:photo, :tags)
  end
end
