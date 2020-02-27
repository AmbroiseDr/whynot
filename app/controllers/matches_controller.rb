class MatchesController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = current_user
  end

  def find_matches
  end
end
