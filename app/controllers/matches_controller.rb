class MatchesController < ApplicationController
  def index
    @user = current_user
    @matches = find_matches
    @find_85_matches = find_85_matches
    @find_70_matches = find_70_matches
    @find_55_matches = find_55_matches
    @find_30_matches = find_30_matches
    @find_15_matches = find_15_matches
  end

  def show
    @user = current_user
    match_id = params[:id].to_i
    @match = User.find(match_id)
    @find_85_matches = find_85_matches
    @find_70_matches = find_70_matches
    @find_55_matches = find_55_matches
    @find_30_matches = find_30_matches
    @find_15_matches = find_15_matches
  end

  def find_matches
    current_user.find_all_matches
  end


  def find_85_matches
    current_user.find_85_matches
  end

  def find_70_matches
    current_user.find_70_matches
  end

  def find_55_matches
    current_user.find_55_matches
  end

  def find_30_matches
    current_user.find_30_matches
  end

  def find_15_matches
    current_user.find_15_matches
  end

end
