class MatchesController < ApplicationController
  def index
    @user = current_user
    @matches = find_matches
    @find_95_matches = find_95_matches
    @find_80_matches = find_80_matches
    @find_65_matches = find_65_matches
    @find_40_matches = find_40_matches
    @find_25_matches = find_25_matches
  end

  def show
    @user = current_user
    match_id = params[:id].to_i
    @match = User.find(match_id)
  end

  def find_matches
    current_user.find_all_matches
  end


  def find_95_matches
    current_user.find_95_matches
  end

  def find_80_matches
    current_user.find_80_matches
  end

  def find_65_matches
    current_user.find_65_matches
  end

  def find_40_matches
    current_user.find_40_matches
  end

  def find_25_matches
    current_user.find_25_matches
  end

end
