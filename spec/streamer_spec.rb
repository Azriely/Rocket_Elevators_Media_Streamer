require 'streamer'
require 'rails_helper'

describe "Streamer" do

    context "Check a string" do
        it "Check if the weather API returns a string" do

        streamer = ElevatorMedia::Streamer.new
            expect(streamer.getContent("Cochin, IN", "Weather")).to be_a(String)
        end
    end
end