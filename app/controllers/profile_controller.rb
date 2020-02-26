#act as user controller
class ProfileController < ApplicationController
  private
  def article_params
  params.require(:profile).permit(:photo)
end
end
