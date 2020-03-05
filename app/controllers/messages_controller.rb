class MessagesController < ApplicationController
  def conversations
    @users_with_conversation = current_user.friends
  end

  def index
    @messages = current_user.conversation_with(params[:user_id])
    @message  = Message.new
    @friend   = User.find(params[:user_id])
    @reco_info = recos(current_user, @friend)

    @chat_room_id = current_user.id * @friend.id
  end

  def create
    @message          = Message.new(message_params)
    @message.sender   = current_user
    @message.receiver = User.find(params[:user_id])
    if @message.save
      redirect_to user_messages_path(@message.receiver)
    else
      @friend   = User.find(params[:user_id])
      @messages = current_user.conversation_with(params[:user_id])
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def recos(user, friend)
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
    tags = user.tag_list
    markers = []
    tags.each do |tag|
      if friend.tag_list.include?(tag)
        url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=48.8534,2.3488&radius=500&keyword=#{translation[tag][0]}&key=#{ENV['GOOGLE_API_PLACES_KEY']}"
        data_api = open(url).read
        parsing = JSON.parse(data_api)["results"]

        parsing.each do |marker|
          if !marker["rating"].nil? && marker["rating"] >= 4
            to_add = {}
            to_add["name"] = marker["name"]
            to_add["rating"] = marker["rating"]
            to_add["type"] = translation[tag][1]
            return to_add
          end
        end
      end
    end
  end
end
