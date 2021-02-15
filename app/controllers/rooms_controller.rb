class RoomsController < ApplicationController
  
  def index
    @room = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "ルーム登録しました"
      redirect_to room_path(@room)
    else
      @error_message = "必要な項目を入力してください"
      render "new"
    end
  end
  
  def search
    @rooms = Room.search_area(params[:search_area])
    @rooms = Room.search_area(params[:search_keyword])
  end

  def show
    @room = Room.find(params[:id])
  end

  private
  def room_params
    params.permit(:room_name,:room_PR,:room_price,:room_address,:images).merge(user_id: @current_user.id)
  end
  
end
