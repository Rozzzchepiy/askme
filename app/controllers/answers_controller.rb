class AnswersController < ApplicationController
  before_action :set_question

  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_to question_path(@question), notice: "Відповідь додано."
    else
      redirect_to question_path(@question), alert: "Не вдалося додати відповідь."
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@answer.question), notice: "Відповідь оновлено."
    else
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question), notice: "Відповідь видалено."
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:content, :user_id)
  end
end
