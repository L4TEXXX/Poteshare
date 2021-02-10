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
      if params[:images]
        @room.images = "#{@room.id}.jpg"
        image = params[:images]
        File.binwrite("public/room_images/#{@room.images}",image.read)
      else
        @room.images = "default_room.jpg"
      end
    else
      @error_message = "必要な項目を入力してください"
      render "new"
    end
  end
  

  def show
    @room = Room.find(params[:id])
  end

  private
  def room_params
    params.permit(:room_name,:room_PR,:room_price,:room_address,:images).merge(user_id: @current_user.id)
  end
  
end
