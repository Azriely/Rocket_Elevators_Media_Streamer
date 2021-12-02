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
      @intervention.employee = nil
  
    #   respond_to do |format|
        if @intervention.save
            create_intervention_ticket
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
  
  
      # Zendesk for interventions submit
        def create_intervention_ticket
            client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
            :subject => "The user has requested an intervention for customer: #{Customer.find(params[:customer]).company_name} ", 
            :comment => { 
                :value => "The information for the customer that requires an intervention is as follows:
                    Company name is: #{Customer.find(params[:customer]).company_name}
                    Building ID is: #{Building.find(params[:building]).id}
                    Battery ID is: #{Battery.find(params[:battery]).id}
                    Column ID is: #{Column.find(params[:column]).id}
                    Elevator ID is: #{Elevator.find(params[:elevator]).id}
                    The Employee to be assigned to the case is: #{Employee.find(params[:employee]).first_name + " " + Employee.find(params[:employee]).last_name }
                    Request Description: #{params[:report]}.
                    "     
            }, 
            :requester => { 
                "name": User.find(current_user.id).email,
                # "email": User.find(current_user.id).email,
            },
            :priority => "normal",
            :type => "question",
            )
                # :value => "The user has requested an intervention with:\nCustomer : " + params[:customer_id] + " - " + (params[:customer_id]).company_name
                # "\nBuilding Admin : " + params[:building_id] + " - " +  @zendesk_building +
                # "\nBattery : " + params[:battery_id] + " - " + @zendesk_batteries +
                # "\nColumn : " + @zendesk_column +
                # "\nElevator : " + @zendesk_elevators +
                # "\nEmployee assigned to case: " + @zendesk_employee +
                # "\nDescription : " + params[:report] 
            # }, 
            # :requester => { 
            #     "name": @zendesk_user,
            #     "email": @zendesk_user 
            # },
            # :priority => "normal",
            # :type => "question",
            # )
        end

    # def get_zendesk_values

    #     @zendesk_user = User.find(current_user.id).email
    #     @zendesk_building = Building.find(params[:building_id]).admin_name
    #     @zendesk_customer = Customer.find(params[:customer_id]).company_name
    #     @zendesk_batteries = Battery.find([params[:battery_id]).status

  
end