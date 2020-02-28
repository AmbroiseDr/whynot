class MatchesController < ApplicationController
  def index
    @user = current_user
    @matches = find_matches
  end

  def show
    @user = current_user
    match_id = params[:id].to_i
    @match = User.find(match_id)
  end

  def find_matches
    matches = []
    users = User.all
    current_user_id = current_user.id
    users.each do |user|
      if user.id != current_user.id
        matches << user
      end
    end
    #matches.sample(4)
    matches.first(4)
  end
end
