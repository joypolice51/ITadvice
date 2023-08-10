class QuestionsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render :show
    end
  end

  def destroy
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:resolved)
  end

end
