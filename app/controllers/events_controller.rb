class EventsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def create
        @event = Event.new(params.require(:event).permit!)
        if @event.save
            render json: {"Status": "Ok"}
        else
            raise "Could not create the event"
        end
    end

    def show
        @event = Event.find(params[:id])
        render json: @event
    end

    def index
        @events = Event.all
        render json: @events
    end

end
