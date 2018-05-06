class Reservation2ServicesController < ApplicationController
  before_action :set_reservation2_service, only: [:show, :edit, :update, :destroy]

  # GET /reservation2_services
  # GET /reservation2_services.json
  def index
    @reservation2_services = Reservation2Service.all
  end

  # GET /reservation2_services/1
  # GET /reservation2_services/1.json
  def show
  end

  # GET /reservation2_services/new
  def new
    @reservation2_service = Reservation2Service.new
  end

  # GET /reservation2_services/1/edit
  def edit
  end

  # POST /reservation2_services
  # POST /reservation2_services.json
  def create
    @reservation2_service = Reservation2Service.new(reservation2_service_params)

    respond_to do |format|
      if @reservation2_service.save
        format.html { redirect_to @reservation2_service, notice: 'Reservation2 service was successfully created.' }
        format.json { render :show, status: :created, location: @reservation2_service }
      else
        format.html { render :new }
        format.json { render json: @reservation2_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservation2_services/1
  # PATCH/PUT /reservation2_services/1.json
  def update
    respond_to do |format|
      if @reservation2_service.update(reservation2_service_params)
        format.html { redirect_to @reservation2_service, notice: 'Reservation2 service was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation2_service }
      else
        format.html { render :edit }
        format.json { render json: @reservation2_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservation2_services/1
  # DELETE /reservation2_services/1.json
  def destroy
    @reservation2_service.destroy
    respond_to do |format|
      format.html { redirect_to reservation2_services_url, notice: 'Reservation2 service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation2_service
      @reservation2_service = Reservation2Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation2_service_params
      params.require(:reservation2_service).permit(:reservation_id, :service_id)
    end
end
