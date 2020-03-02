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
    maching_mbti = {
      "INFP" => {95 => ["ENFJ","ENTJ"],
                 80 => ["INFP","ENFP","INFJ","INTJ","INTP","ENTP"],
                 25 => ["ISFP","ESFP","ISTP","ESTP","ISFJ","EFSJ","ISTJ","ESTJ"],
                },
      "ENFP" => {95 => ["INFJ", "INTJ"],
                 80 => ["INFP","ENPF","ENFJ","ENTJ","INTP","ENTP"],
                 25 => ["ISFP", "ESFP", "ISTP","ESTP","ISFJ","ESFJ","ISTJ","ESTJ"],
                },
      "INFJ" => {95 => ["ENFP","ENTP"],
                 80 => ["INFP","INFJ","ENFJ","INTJ","ENTJ","INTP"],
                 25 => ["ISFP", "ESFP", "ISTP","ESTP","ISFJ","ESFJ","ISTJ","ESTJ"],
                },
      "ENFJ" => {95 => ["INFP","ISFP"],
                 80 => ["ENFP","INFJ","ENFJ","INTJ","ENTJ","INTP","ENTP"],
                 25 => ["ESFP", "ISTP","ESTP","ISFJ","ESFJ","ISTJ","ESTJ"],
                },
      "INTJ" => {95 => ["ENFP","ENTP"],
                 80 => ["INFP","INFJ","ENFJ","INTJ","ENTJ","INTP"],
                 65 => ["ISFP", "ESFP", "ISTP","ESTP"],
                 40 => ["ISFJ","ESFJ","ISTJ","ESTJ"],
                },
      "ENTJ" => {95 => ["INFP","INTP"],
                 80 => ["ENFP","INFJ","ENFJ","INTJ","ENTJ","ENTP"],
                 65 => ["ISFP","ESFP","ISTP","ESTP","ISFJ","EFSJ","ISTJ","ESTJ"],
                },
      "INTP" => {95 => ["ENTJ","ESTJ"],
                 80 => ["INFP","ENFP","INFJ","ENFJ","INTJ","INTP","ENTP"],
                 65 => ["ISFP", "ESFP", "ISTP","ESTP"],
                 40 => ["ISFJ","ESFJ","ISTJ"],
                },
      "ENTP" => {95 => ["INFJ", "INTJ"],
                 80 => ["INFP","ENPF","ENFJ","ENTJ","INTP","ENTP"],
                 65 => ["ISFP", "ESFP", "ISTP","ESTP"],
                 40 => ["ISFJ","ESFJ","ISTJ","ESTJ"],
                },
      "ISFP" => {95 => ["ENFJ","ESFJ","ESTJ"],
                 65 => ["INTJ", "ENTJ","INTP","ENTP","ISFJ","ISTJ"],
                 40 => ["ISFP", "ESFP", "ISTP","ESTP"],
                 25 => ["INFP","ENFP","INFJ"],
                },
      "ESFP" => {95 => ["ISFJ","ISTJ"],
                 65 => ["INTJ", "ENTJ","INTP","ENTP","ESFJ","ESTJ"],
                 40 => ["ISFP", "ESFP", "ISTP","ESTP"],
                 25 => ["INFP","ENFP","INFJ","ENFJ"],
                },
      "ISTP" => {95 => ["ESFJ","ESTJ"],
                 65 => ["INTJ", "ENTJ","INTP","ENTP","ISFJ","ISTJ"],
                 40 => ["ISFP", "ESFP", "ISTP","ESTP"],
                 25 => ["INFP","ENFP","INFJ","ENFJ"],
                },
      "ESTP" => {95 => ["ISFJ","ISTJ"],
                 65 => ["INTJ", "ENTJ","INTP","ENTP","ESFJ","ESTJ"],
                 40 => ["ISFP", "ESFP", "ISTP","ESTP"],
                 25 => ["INFP","ENFP","INFJ","ENFJ"],
                },
      "ISFJ" => {95 => ["ESFP","ESTP"],
                 80 => ["ISFJ","EFSJ","ISTJ","ESTJ"],
                 65 => ["ENTJ","ISFP","ISTP"],
                 40 => ["INTJ","INTP","ENTP"],
                 25 => ["INFP","ENFP","INFJ","ENFJ"],
                },
      "ESFJ" => {95 => ["ISFP","ISTP"],
                 80 => ["ISFJ","EFSJ","ISTJ","ESTJ"],
                 65 => ["ESFP","ESTP"],
                 40 => ["INTJ","INTP","ENTP"],
                 25 => ["INFP","ENFP","INFJ","ENFJ"],
                },
      "ISTJ" => {95 => ["ESFP","ESTP"],
                 80 => ["ISFJ","EFSJ","ISTJ","ESTJ"],
                 65 => ["ENTJ","ISFP","ISTP"],
                 40 => ["INTJ","INTP","ENTP"],
                 25 => ["INFP","ENFP","INFJ","ENFJ"],
                },
      "ESTJ" => {95 => ["INTP","ISFP","ISTP"],
                 80 => ["ISFJ","EFSJ","ISTJ","ESTJ"],
                 65 => ["ESFP","ESTP"],
                 40 => ["INTJ","ENTP"],
                 25 => ["INFP","ENFP","INFJ","ENFJ"],
                },
    }

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
