class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path # 正常に処理された場合のリダイレクト先を指定
    else
      render :new # エラーがある場合は new テンプレートを再描画
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_id: current_user.id)
  end
end
