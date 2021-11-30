class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]

  # KEEP
  def index
    redirect_to index_url
    @interventions = Intervention.all
  end

  # KEEP
  def show
    redirect_to index_url
  end

  # GET /interventions/new
  def new
    redirect_to index_url
    @intervention = Intervention.new
  end

  # GET /interventions/1/edit
  def edit
    redirect_to index_url
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to index_url, notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to index_url, notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to index_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def building_select
    puts "Entered controller"
    @buildings = Building.where("customer_id = ?", params[:Client])
    if request.xhr?
        respond_to do |format|
            format.json { render :json => @buildings }
          end
      end
  end
  def battery_select
    puts "Entered controller"
    @batteries = Battery.where("building_id = ?", params[:Building])
    if request.xhr?
        respond_to do |format|
            format.json { render :json => @batteries }
          end
      end
  end
  def column_select
    puts "Entered controller"
    @columns = Column.where("battery_id = ?", params[:Battery])
    if request.xhr?
        respond_to do |format|
            format.json { render :json => @columns }
          end
      end
  end
  def elevator_select
    puts "Entered controller"
    @elevators = Elevator.where("column_id = ?", params[:Column])
    if request.xhr?
        respond_to do |format|
            format.json { render :json => @elevators }
          end
      end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      redirect_to index_url
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:Author, :Client, :Building, :Battery, :Column, :Lift, :Employee, :start_date_and_time_of_the_intervention, :end_date_and_time_of_the_intervention, :result, :report, :status)
    end
end