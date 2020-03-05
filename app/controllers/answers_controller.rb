class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user
    if @answer.save
      current_user.answered!
      if current_user.answers.size % 4 != 0
        normalize_answers
        redirect_to question_path(current_user.questions_not_answered.sample)
      else
        current_user.save
        find_user_answers
        scoring_question
        scoring_answer
        change_mbti
        redirect_to matches_path
      end
    else
      render "questions/show"
    end
  end

  def find_user_answers
    @answers = Answer.all.find_all { |i| i.user_id == current_user.id }
  end

  def normalize_answers
    if @question.type_question == "smileys" && @answer.value > 2
      @answer.value = 1
    elsif @question.type_question == "jauge" && @answer.value > 50
      @answer.value = 1
    else
      @answer.value = -1
    end
      @answer.save
  end

  def scoring_question
    @scoring_question = Hash.new(0)
    @letters = []
    @answers.each do |answer|
      letter_position = Question.find(answer.question_id).letter_position
      @letters << letter_position
    end
    @letters.each do |letter|
      @scoring_question[letter] += 1
    end
    @scoring_question
  end

  def scoring_answer
    @scoring_answer = Hash.new(0)
    @answers.each do |answer|
      @letters.each do |letter|
        @scoring_answer[letter] += answer.value
      end
    end
    @scoring_answer
  end

  def change_mbti
    updated_mbti = []
    if @scoring_answer[1] < 0
      updated_mbti << "E"
    else
      updated_mbti << "I"
    end
    if @scoring_answer[2] < 0
      updated_mbti << "S"
    else
      updated_mbti << "N"
    end
    if @scoring_answer[3] < 0
      updated_mbti << "F"
    else
      updated_mbti << "T"
    end
    if @scoring_answer[4] < 0
      updated_mbti << "J"
    else
      updated_mbti << "P"
    end
    updated_mbti = updated_mbti.join
    mbti_object = ProfileMbti.find_by(mbti: updated_mbti)
    current_user.profile_mbti = mbti_object
    current_user.save
  end

  private

  def answer_params
    params.require(:answer).permit(:value)
  end
end
