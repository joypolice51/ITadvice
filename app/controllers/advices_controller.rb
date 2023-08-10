class AdvicesController < ApplicationController
  def new
    @advice = Advice.find(params[:id])
  end

  def index
  end

  def create
    @advice = Advice.find(params[:id])
    if @advice.update(advice_params)
      redirect_to @advice
    else 
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
   def advice_params
    params.require(:advice).permit(:content).merge(:user_id, :question_id, :public)
   end

end
