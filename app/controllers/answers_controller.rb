class AnswersController < ApplicationController

  def create
    question = Question.find(params[:answer][:question_id])
    answer = question.answers.create(answer_params)

    MainMailer.notify_question_author(answer).deliver_later #this way the answer can be made without the user having to wait for the email to send out.

    session[:current_user_email] = answer_params[:email]
    redirect_to question
  end

  private

  def answer_params
    params.require(:answer).permit(:email, :body)
  end

end
