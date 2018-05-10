class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def is_free
    room = Room.find(params[:room_id])
    date_on = Date.parse(params[:date])
    room_reservations = Reservation2Room.where(['room_id = ?', room.id])
    is_free = true
    room_reservations.each { |r| is_free = is_free && !(r.reservation.date_in <= date_on && date_on <= r.reservation.date_out) }
    respond_to do |format|
      format.json { render json: is_free }
    end
  end

  def free_rooms
    date_on = Date.parse(params[:date])
    reservations = Reservation.
      where(['date_in <= ? and ? <= date_out', date_on, date_on])
    booked_rooms = reservations.map { |r| r.reservation2_rooms.map { |r2r| r2r.room.id }}.flatten.uniq
    free_rooms = Room.all.reject{ |r| puts r.id.class; booked_rooms.include? r.id }
    
    respond_to do |format|
      format.json { render json: free_rooms }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:num, :rooms_count, :price)
    end
end
