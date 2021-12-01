class InterventionController < ApplicationController
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
    #   @intervention = Intervention.new(intervention_params)
      @intervention = Intervention.new

      @intervention.user_id = current_user.employee.id
      @intervention.customer_id = params[:customer]
      @intervention.building_id = params[:building]
      @intervention.battery_id = params[:battery]
      @intervention.column_id = params[:column]
      @intervention.elevator_id = params[:elevator]
      @intervention.employee_id = params[:employee] 
      @intervention.result = params[:result] 
      @intervention.report = params[:report]
      @intervention.status = params[:status]
  
    #   respond_to do |format|
        if @intervention.save!
        #   format.html { redirect_to index_url, notice: "Intervention was successfully created." }
        #   format.json { render :show, status: :created, location: @intervention }
        redirect_back fallback_location: root_path
        # else
        #   format.html { render :new, status: :unprocessable_entity }
        #   format.json { render json: @intervention.errors, status: :unprocessable_entity }
        end
    #   end
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
      @buildings = Building.where("customer_id = ?", params[:customerID])
      if request.xhr?
          respond_to do |format|
              format.json { render :json => @buildings }
            end
        end
    end
    def battery_select
      puts "Entered controller"
      @batteries = Battery.where("building_id = ?", params[:buildingID])
      if request.xhr?
          respond_to do |format|
              format.json { render :json => @batteries }
            end
        end
    end
    def column_select
      puts "Entered controller"
      @columns = Column.where("battery_id = ?", params[:batteryID])
      if request.xhr?
          respond_to do |format|
              format.json { render :json => @columns }
            end
        end
    end
    def elevator_select
      puts "Entered controller"
      @elevators = Elevator.where("column_id = ?", params[:columnID])
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
        params.require(:intervention).permit(:author, :customer, :building, :battery, :column, :elevator, :employee, :created_at, :updated_at, :result, :report, :status)
      end
  
      # Zen Desk Data
      def getData
        flash[:success] = ""
        quote = Quote.new
  
        #Customer Info
        quote.company_name = params['company_name']
        # quote.last_name = params['last_name']
        quote.email = params['email']
        quote.phone_number = params['phone_number']
   
        #Building Type
        quote.building_type = params["buildings"]
  
        # Elevator Type
        quote.services_type = params["radioSelect"]
        # Building Info
        quote.apartments = params["num_of_apts"]
        quote.floors = params["num_of_floors"]
        quote.basements = params["num_of_basements"]
        quote.companies = params["num_of_companies"]
        quote.parking_spots = params["num_of_parking"]
        quote.elevators = params["num_of_elevators"]
        quote.corporations = params["num_of_corporations"]
        quote.maximum_occupancy = params["max_occupancy"]
        quote.business_hours = params["business_hours"]
        
        #Price
        quote.total_price = params["total_price"].to_s
        
        quote.amount_of_elevator = params["amntElevator"]
        quote.price_per_elevator = params["priceElevator"]
        quote.installation = params["installation_fee"]
        quote.price_elevator_total = params["priceElevatorTotal"]
           
  
        if quote.save
            create_quote_ticket
            # flash[:success] = "Your Quote has been successfully submitted    "
            
            redirect_to root_path, flash: {success: "Your quote has been successfully submitted"}
         else
        
        
         
          end
     
    end
  
      # Zendesk for interventions submit
      def create_quote_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESKINT_URL']
            config.username = ENV['ZENDESKINT_USERNAME']
            config.token = ENV['ZENDESKINT_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
            :subject => "The company #{params['company_name']}", 
            :comment => { 
                :value => "The contact company #{params['company_name']} 
                    can be reached at email #{params['email']} and at phone number #{params['phone_number']}. 
                    Building type selected is #{params["buildings"]} with the service type #{params["radioSelect"]}. 
                    The amount of required elevator is #{params["amntElevator"]} and total price is #{params["total_price"]}.\n"
                   
            }, 
            :requester => { 
                "name": params['email'], 
                "email": params['email'],
            },
            :priority => "normal",
            :type => "task",
            )
    end
  
  end