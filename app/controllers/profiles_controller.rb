#act as user controller
class ProfilesController < ApplicationController

  def show
  end

  def edit
  end

  private

  def article_params
    params.require(:profile).permit(:photo, :tag_list)
  end
end
