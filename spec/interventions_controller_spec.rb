require 'rails_helper'

RSpec.describe InterventionController, :type => :controller do

    describe "GET interventionData" do
        it "has a JSON" do
            get :interventionData
            puts response
            expect(response.content_type).to eq "application/json"
        end
    end

    # Testing if the interventions controller returns a succesful HTTP response
    it"should give back a 200 succesful HTTP response" do
        expect(@response.status).to eq (200)
    end
    # Testing if the interventions controller returns successful response
   
    it "interventions controller should succesfully returned an Intervention object" do
        expect(@response.status).to eq (200)
        expect(Intervention).to_not eq(nil)
        puts Intervention
    end

    # describe "Post Create" do
    #     login_user
    #     context "Given valid params" do
    #         it "Create a new intervention request" do                
    #             valid_params = {
    #                 customer: customer.id,
    #                 building: building.id,
    #                 battery: battery.id,
    #                 column: column.id,
    #                 elevator: elevator.id,
    #                 employee: employee.id,
    #                 report: "Test",
    #             }
    #             post :create, params: valid_params

    #             expect(Intervention.last.report).to eq(valid_params[:report])
    #             expect(Intervention.last.employee.id).to eq(valid_params[:employee])
    #             expect(Intervention.last.customer.id).to eq(valid_params[:customer])                
    #         end
    #     end
    # end
end