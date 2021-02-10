class ReservationsController < ApplicationController
    def new
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
            redirect_to reservation_path(@reservation.id)
            flash[:notice] = "予約しました。"
        else
            render "new"
            @error_message = "必要な項目を入力してください"
        end
    end

    def show
        @reservation = Reservation.find(params[:id])
        @room = @reservation.room
    end

    def index
        @reservation = Reservation.all
    end

    private
    def reservation_params
        params.permit(:start_date, :end_date, :num_people, :room_id).merge(user_id: @current_user.id)
    end
end
