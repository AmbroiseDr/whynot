class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user
    if @answer.save
      if current_user.answers.size % 3 != 0
        redirect_to question_path(current_user.questions_not_answered.sample)
      else
        redirect_to matches_path
      end
    else
      render "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:value)
  end
end
