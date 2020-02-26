#act as user controller
class ProfilesController < ApplicationController

  private

  def article_params
    params.require(:profile).permit(:photo, :tag_list)
  end
end
