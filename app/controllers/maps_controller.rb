require 'json'
require 'open-uri'

class MapsController < ApplicationController
  def index
    translation = {
    'sport'   => ['Sport','le sport'],
    'cooking' => ['Cours de cuisine', "les cours de cuisine"],
    'museum'  => ['Exposition', "les expositions"],
    'music'   => ['Concert', "les concerts"],
    'walk'    =>  ['Promenade', "la promenade"],
    'cofee'   => ['Coffe', "discuter autour d'un café"],
    'game'    => ['Bar a jeux',"les bars à jeux"],
    'escapes'  => ['Escape game'," les escapes game"],
    }
    @user = current_user
    matches = find_matches.first(4)
    tags = @user.tag_list
    @markers=[]
    tags.each do |tag|
      url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=48.8534,2.3488&radius=500&keyword=#{translation[tag][0]}&key=#{ENV['GOOGLE_API_PLACES_KEY']}"
      data_api = open(url).read
      parsing = JSON.parse(data_api)["results"]
      parsing.each do |marker|
        if !marker["rating"].nil? && marker["rating"] >= 4
          to_add = marker["geometry"]["location"]
          to_add["name"] = marker["name"]
          to_add["icon"] = marker["icon"]
          to_add["rating"] = marker["rating"]
          to_add["type"] = translation[tag][0]
          to_add["users_match"] = []
          to_add["icon"] = marker["icon"]
          matches.each do |user_match|
            if user_match.tag_list.include?(tag)
              hash_info = {
                "user_id" => user_match.id,
                "user_name" => user_match.name,
              }
              hash_info["user_photo_key"] = user_match.photo.key if user_match.photo.attached?
              to_add["users_match"] << hash_info
              to_add["icon"] = "http://maps.google.com/mapfiles/kml/paddle/orange-stars.png"
            end
          end
          @markers.push(to_add)
        end
      end
    end
  end

  def find_matches
    current_user.find_all_matches
  end
end
