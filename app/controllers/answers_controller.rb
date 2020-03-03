class AnswersController < ApplicationController
  def create
    raise
  end

  private

  def answer_params
    params.require(:answer).permit(:question, :value)
  end
end
