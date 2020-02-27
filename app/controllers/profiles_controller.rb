#act as user controller
class ProfilesController < ApplicationController

  def show
  end

  def edit
    @profile = current_user
  end

  def count_tags(tags_array)
    hash_tags = Hash.new(0)
    tag_display = []
    tags_array.each do |tag|
      hash_tags[tag]+=1
    end

    hash_tags.each do |key,value|
      if value.odd?
        tag_display << key
      end
    end
    tag_display
  end

  def update
    tags = profile_params[:form_tag_list].split(",")
    tags = count_tags(tags).each do |tag|
      current_user.tag_list.add(tag)
    end
    current_user.save
    redirect_to profile_path
  end

  private

  def profile_params
    params.require(:user).permit(:photo, :form_tag_list)
  end
end
