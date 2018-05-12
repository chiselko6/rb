class Reservation2RoomsController < ApplicationController
  before_action :set_reservation2_room, only: [:show, :edit, :update, :destroy]

  # GET /reservation2_rooms
  # GET /reservation2_rooms.json
  def index
    @reservation2_rooms = Reservation2Room.all
  end

  # GET /reservation2_rooms/1
  # GET /reservation2_rooms/1.json
  def show
  end

  # GET /reservation2_rooms/new
  def new
    @reservation2_room = Reservation2Room.new
  end

  # GET /reservation2_rooms/1/edit
  def edit
  end

  # POST /reservation2_rooms
  # POST /reservation2_rooms.json
  def create
    @reservation2_room = Reservation2Room.new(reservation2_room_params)
    promo_percent = @reservation2_room.calculate_percentage_promo
    if promo_percent > 0
      @reservation2_room.promo = promo_percent
    end

    respond_to do |format|
      if @reservation2_room.save
        format.html { redirect_to @reservation2_room, notice: 'Reservation2 room was successfully created.' }
        format.json { render :show, status: :created, location: @reservation2_room }
      else
        format.html { render :new }
        format.json { render json: @reservation2_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservation2_rooms/1
  # PATCH/PUT /reservation2_rooms/1.json
  def update
    respond_to do |format|
      if @reservation2_room.update(reservation2_room_params)
        format.html { redirect_to @reservation2_room, notice: 'Reservation2 room was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation2_room }
      else
        format.html { render :edit }
        format.json { render json: @reservation2_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservation2_rooms/1
  # DELETE /reservation2_rooms/1.json
  def destroy
    @reservation2_room.destroy
    respond_to do |format|
      format.html { redirect_to reservation2_rooms_url, notice: 'Reservation2 room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation2_room
      @reservation2_room = Reservation2Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation2_room_params
      params.require(:reservation2_room).permit(:reservation_id, :room_id)
    end
end
