require 'json'
require 'open-uri'

class MapsController < ApplicationController
  def index
    @user = current_user
    url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=48.8534,2.3488&radius=1500&keyword=bar%20a%20jeux&key=AIzaSyAZxfU1cDKdPtnHDHKMfHzq7DtJ3mIBv50'
    data_api = open(url).read
    parsing = JSON.parse(data_api)["results"]
    @markers=[]
    parsing.each do |marker|
      to_add = marker["geometry"]["location"]
      to_add["name"] = marker["name"]
      @markers.push(marker["geometry"]["location"])
    end

  end
end
