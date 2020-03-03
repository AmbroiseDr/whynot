require 'json'
require 'open-uri'

class MapsController < ApplicationController
  def index
    translation = {
    'sport'   => 'Sport',
    'cooking' => 'Cours de cuisine',
    'museum'  => 'Exposition',
    'music'   => 'Concert',
    'walk'    =>  'Promenade',
    'cofee'   => 'Coffe',
    'game'    => 'Bar a jeux',
    'escape'  => 'Escape game',
    }
    @user = current_user
    tags = @user.tag_list
    @markers=[]
    tags.each do |tag|
      url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=48.8534,2.3488&radius=500&keyword=#{translation[tag]}&key=#{ENV['GOOGLE_API_PLACES_KEY']}"
      data_api = open(url).read
      parsing = JSON.parse(data_api)["results"]
      parsing.each do |marker|
        @marker = marker
        if !marker["rating"].nil? && marker["rating"] >= 4
          to_add = marker["geometry"]["location"]
          to_add["name"] = marker["name"]
          to_add["icon"] = marker["icon"]
          to_add["rating"] = marker["rating"]
          @markers.push(to_add)
        end
      end
    end
  end
end
