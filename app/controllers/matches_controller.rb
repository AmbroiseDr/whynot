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
    matches = current_user.find_all_matches
  end
end
